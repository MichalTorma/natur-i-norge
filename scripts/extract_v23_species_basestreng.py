#!/usr/bin/env python3
"""
Extract species ground truth from the v2.3 database for TB01 (T-4) forest.

Two complementary datasets:

1. GAD matrix (primary) — species occurrence constancy (0–6) at ecological matrix
   coordinates (e.g. KA.ab/UF.a/KI.0a). This is the numeric likelihood the user
   remembers from the old app matrix overlay.

2. AR8 indicators (secondary) — species indicator basestreng codes (e.g. v, v*, m;v)
   deduplicated at species+basestreng level (not per minor type, since types changed
   between v2.3 and v3.0).

Outputs CSV tables in scratch/ for manual alignment with NiN 3.0 TB01 basestreng.
"""

import csv
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
V23_DB = ROOT / "assets" / "nin_database_v2.3.db"
OUT_DIR = ROOT / "scratch"

GAD_QUERY = """
SELECT
    s.scientificNameId,
    s.scientificName,
    s.vernacularName,
    gv.elementarySegmentCombination_id AS matrix_coordinate,
    gv.valueM7Scale_id AS constancy_m7,
    gs.Constancy AS constancy_label
FROM nin_GadValue gv
JOIN nin_Species s ON gv.species_id = s.scientificNameId
JOIN nin_GadScale gs ON gv.valueM7Scale_id = gs.m7Scale
WHERE gv.majorType_id = 'T-4'
GROUP BY s.scientificNameId, gv.elementarySegmentCombination_id
ORDER BY s.scientificName, gv.elementarySegmentCombination_id
"""

AR8_QUERY = """
SELECT
    isp.gbif_id,
    isp.name_latin,
    isp.name_nb,
    it.full_code AS basestreng,
    it.code AS basestreng_codes,
    GROUP_CONCAT(DISTINCT mt._id) AS v23_minor_types,
    COUNT(DISTINCT mt._id) AS n_minor_types
FROM nin_InferenceTypes it
JOIN nin_InferenceSpecies isp ON it.gbif_id = isp.gbif_id
JOIN nin_MinorTypeScaled mts ON it.minorTypeScaled_id = mts._id
JOIN nin_MinorType mt ON mts.minorType_id = mt._id
WHERE mt.majorType_id = 'T-4'
GROUP BY isp.gbif_id, it.full_code
ORDER BY isp.name_latin, it.full_code
"""


def parse_matrix_coordinate(coord: str) -> dict[str, str]:
    """Parse 'KA.ab/UF.a/KI.0a' into axis components."""
    parts = {}
    for segment in coord.split("/"):
        if "." in segment:
            axis, trinn = segment.split(".", 1)
            parts[f"axis_{axis.lower()}"] = trinn
    return parts


def write_gad_ground_truth(conn: sqlite3.Connection) -> tuple[Path, int]:
    out_path = OUT_DIR / "tb01_gad_matrix_ground_truth.csv"
    fieldnames = [
        "scientific_name_id",
        "name_latin",
        "name_nb",
        "matrix_coordinate",
        "axis_ka",
        "axis_uf",
        "axis_ki",
        "constancy_m7",
        "constancy_label",
        "v30_lm_ka_trinn",
        "v30_lm_uf_trinn",
        "v30_lm_vm_trinn",
        "alignment_status",
        "notes",
    ]

    rows = conn.execute(GAD_QUERY).fetchall()

    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for row in rows:
            axes = parse_matrix_coordinate(row[3])
            writer.writerow({
                "scientific_name_id": row[0],
                "name_latin": row[1],
                "name_nb": row[2],
                "matrix_coordinate": row[3],
                "axis_ka": axes.get("axis_ka", ""),
                "axis_uf": axes.get("axis_uf", ""),
                "axis_ki": axes.get("axis_ki", ""),
                "constancy_m7": row[4],
                "constancy_label": row[5],
                "v30_lm_ka_trinn": "",
                "v30_lm_uf_trinn": "",
                "v30_lm_vm_trinn": "",
                "alignment_status": "pending",
                "notes": "",
            })

    return out_path, len(rows)


def write_ar8_indicators(conn: sqlite3.Connection) -> tuple[Path, int]:
    out_path = OUT_DIR / "tb01_ar8_basestreng_indicators.csv"
    fieldnames = [
        "gbif_id",
        "name_latin",
        "name_nb",
        "basestreng",
        "basestreng_codes",
        "basestreng_layers",
        "v23_minor_types",
        "n_minor_types",
        "v30_basestreng",
        "alignment_status",
        "notes",
    ]

    rows = conn.execute(AR8_QUERY).fetchall()

    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for row in rows:
            writer.writerow({
                "gbif_id": row[0],
                "name_latin": row[1],
                "name_nb": row[2],
                "basestreng": row[3],
                "basestreng_codes": row[4],
                "basestreng_layers": row[4],  # parsed layer codes: v, m*, s-, etc.
                "v23_minor_types": row[5],
                "n_minor_types": row[6],
                "v30_basestreng": "",
                "alignment_status": "pending",
                "notes": "",
            })

    return out_path, len(rows)


def main() -> None:
    if not V23_DB.exists():
        raise SystemExit(f"v2.3 database not found: {V23_DB}")

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(V23_DB)

    gad_path, gad_rows = write_gad_ground_truth(conn)
    ar8_path, ar8_rows = write_ar8_indicators(conn)

    gad_species = conn.execute(
        "SELECT COUNT(DISTINCT species_id) FROM nin_GadValue WHERE majorType_id = 'T-4'"
    ).fetchone()[0]
    gad_coords = conn.execute(
        "SELECT COUNT(DISTINCT elementarySegmentCombination_id) "
        "FROM nin_GadValue WHERE majorType_id = 'T-4'"
    ).fetchone()[0]
    ar8_species = conn.execute(
        "SELECT COUNT(DISTINCT gbif_id) FROM nin_InferenceTypes it "
        "JOIN nin_MinorTypeScaled mts ON it.minorTypeScaled_id = mts._id "
        "JOIN nin_MinorType mt ON mts.minorType_id = mt._id "
        "WHERE mt.majorType_id = 'T-4'"
    ).fetchone()[0]
    conn.close()

    print("GAD matrix ground truth (primary — species × coordinate × constancy 0–6):")
    print(f"  {gad_path}")
    print(f"  {gad_rows} rows, {gad_species} species, {gad_coords} matrix coordinates")
    print()
    print("AR8 basestreng indicators (secondary — species × basestreng, deduplicated):")
    print(f"  {ar8_path}")
    print(f"  {ar8_rows} rows, {ar8_species} species")
    print()
    print("Constancy scale (m7):")
    print("  0 = absent")
    print("  1 = < 1/32")
    print("  2 = 1/32 – 1/8")
    print("  3 = 1/8 – 3/8")
    print("  4 = 3/8 – 4/5")
    print("  5 = 3/8 – 4/5 and dominant, or > 4/5")
    print("  6 = > 4/5 and dominant")


if __name__ == "__main__":
    main()
