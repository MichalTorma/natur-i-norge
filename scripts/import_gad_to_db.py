#!/usr/bin/env python3
"""
Import GAD species matrix data from the v2.3 ground truth into nin_database.sqlite.

Axis translation (v2.3 → v3.0):
  KA.ab  → LM-KA a, b  (combined kalkfattig step, not c)
  KA.*   → LM-KA *     (direct for c–i)
  UF.*   → LM-UF *     (direct a–h)
  KI.0a  → LM-VM 0
  KI.bc  → LM-VM b, c  (combined fuktig step)
"""

import csv
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
V23_DB = ROOT / "assets" / "nin_database_v2.3.db"
DB_PATH = ROOT / "assets" / "nin_database.sqlite"
HOVEDTYPE_ID = "NA-TB01"

GAD_QUERY = """
SELECT
    s.scientificNameId,
    s.scientificName,
    s.vernacularName,
    gv.elementarySegmentCombination_id,
    gv.valueM7Scale_id
FROM nin_GadValue gv
JOIN nin_Species s ON gv.species_id = s.scientificNameId
WHERE gv.majorType_id = 'T-4'
GROUP BY s.scientificNameId, gv.elementarySegmentCombination_id
"""

GBIF_QUERY = """
SELECT isp.gbif_id, isp.name_latin
FROM nin_InferenceSpecies isp
"""


def parse_coordinate(coord: str) -> tuple[str, str, str]:
    ka = uf = ki = ""
    for segment in coord.split("/"):
        if "." not in segment:
            continue
        axis, trinn = segment.split(".", 1)
        if axis == "KA":
            ka = trinn
        elif axis == "UF":
            uf = trinn
        elif axis == "KI":
            ki = trinn
    return ka, uf, ki


def expand_ka(trinn: str) -> list[str]:
    if trinn == "ab":
        return ["a", "b"]
    return [trinn]


def expand_ki(trinn: str) -> list[str]:
    if trinn == "0a":
        return ["0"]
    if trinn == "bc":
        return ["b", "c"]
    return [trinn]


def ensure_schema(conn: sqlite3.Connection) -> None:
    conn.executescript(
        """
        CREATE TABLE IF NOT EXISTS nin_species (
            id TEXT PRIMARY KEY,
            gbif_id INTEGER,
            name_latin TEXT NOT NULL,
            name_nb TEXT
        );

        CREATE TABLE IF NOT EXISTS nin_species_gad (
            hovedtype_id TEXT NOT NULL,
            species_id TEXT NOT NULL,
            lm_ka_trinn TEXT NOT NULL,
            lm_uf_trinn TEXT NOT NULL,
            lm_vm_trinn TEXT NOT NULL,
            constancy_m7 INTEGER NOT NULL,
            PRIMARY KEY (hovedtype_id, species_id, lm_ka_trinn, lm_uf_trinn, lm_vm_trinn),
            FOREIGN KEY (species_id) REFERENCES nin_species(id)
        );
        """
    )


def load_gbif_lookup(v23_conn: sqlite3.Connection) -> dict[str, int]:
    lookup: dict[str, int] = {}
    for gbif_id, name_latin in v23_conn.execute(GBIF_QUERY):
        lookup[name_latin] = gbif_id
    return lookup


def import_gad(v23_conn: sqlite3.Connection, target_conn: sqlite3.Connection) -> tuple[dict, set]:
    gbif_lookup = load_gbif_lookup(v23_conn)

    species_rows: dict[str, tuple[str, str | None, int | None]] = {}
    gad_rows: set[tuple[str, str, str, str, str, int]] = set()

    for scientific_name_id, name_latin, name_nb, coord, constancy in v23_conn.execute(GAD_QUERY):
        ka, uf, ki = parse_coordinate(coord)
        if not ka or not uf or not ki:
            continue

        species_rows[scientific_name_id] = (
            name_latin,
            name_nb,
            gbif_lookup.get(name_latin),
        )

        for lm_ka in expand_ka(ka):
            for lm_vm in expand_ki(ki):
                gad_rows.add((
                    HOVEDTYPE_ID,
                    scientific_name_id,
                    lm_ka,
                    uf,
                    lm_vm,
                    int(constancy),
                ))

    target_conn.execute("DELETE FROM nin_species_gad WHERE hovedtype_id = ?", (HOVEDTYPE_ID,))
    target_conn.execute("DELETE FROM nin_species")

    target_conn.executemany(
        "INSERT OR REPLACE INTO nin_species (id, gbif_id, name_latin, name_nb) VALUES (?, ?, ?, ?)",
        [
            (species_id, gbif_id, name_latin, name_nb)
            for species_id, (name_latin, name_nb, gbif_id) in species_rows.items()
        ],
    )

    target_conn.executemany(
        """
        INSERT OR REPLACE INTO nin_species_gad
            (hovedtype_id, species_id, lm_ka_trinn, lm_uf_trinn, lm_vm_trinn, constancy_m7)
        VALUES (?, ?, ?, ?, ?, ?)
        """,
        list(gad_rows),
    )

    return species_rows, gad_rows


def main() -> None:
    if not V23_DB.exists():
        raise SystemExit(f"v2.3 database not found: {V23_DB}")
    if not DB_PATH.exists():
        raise SystemExit(f"v3 database not found: {DB_PATH}")

    v23_conn = sqlite3.connect(V23_DB)
    target_conn = sqlite3.connect(DB_PATH)

    ensure_schema(target_conn)
    species_rows, gad_rows = import_gad(v23_conn, target_conn)

    species_count = target_conn.execute("SELECT COUNT(*) FROM nin_species").fetchone()[0]
    gad_count = target_conn.execute(
        "SELECT COUNT(*) FROM nin_species_gad WHERE hovedtype_id = ?",
        (HOVEDTYPE_ID,),
    ).fetchone()[0]
    coord_count = target_conn.execute(
        """
        SELECT COUNT(DISTINCT lm_ka_trinn || '/' || lm_uf_trinn || '/' || lm_vm_trinn)
        FROM nin_species_gad WHERE hovedtype_id = ?
        """,
        (HOVEDTYPE_ID,),
    ).fetchone()[0]

    target_conn.commit()

    # Stamp Drift schema version so pre-populated DB opens without re-running migrations.
    target_conn.execute("PRAGMA user_version = 5")
    target_conn.commit()

    # Sidecar for web clients upgrading from schema v4 (empty GAD tables after migration).
    sidecar_path = ROOT / "assets" / "gad_na_tb01.sqlite"
    if sidecar_path.exists():
        sidecar_path.unlink()
    sidecar_conn = sqlite3.connect(sidecar_path)
    ensure_schema(sidecar_conn)
    sidecar_conn.executemany(
        "INSERT INTO nin_species (id, gbif_id, name_latin, name_nb) VALUES (?, ?, ?, ?)",
        [
            (species_id, gbif_id, name_latin, name_nb)
            for species_id, (name_latin, name_nb, gbif_id) in species_rows.items()
        ],
    )
    sidecar_conn.executemany(
        """
        INSERT INTO nin_species_gad
            (hovedtype_id, species_id, lm_ka_trinn, lm_uf_trinn, lm_vm_trinn, constancy_m7)
        VALUES (?, ?, ?, ?, ?, ?)
        """,
        list(gad_rows),
    )
    sidecar_conn.commit()
    sidecar_conn.close()

    v23_conn.close()
    target_conn.close()

    print(f"Imported GAD into {DB_PATH}")
    print(f"  {species_count} species")
    print(f"  {gad_count} GAD rows (after KA.ab → a,b and KI.bc → b,c expansion)")
    print(f"  {coord_count} unique LM coordinates")
    print(f"Wrote sidecar {sidecar_path} for web migration")


if __name__ == "__main__":
    main()
