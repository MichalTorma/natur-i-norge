#!/usr/bin/env python3
"""Patch a dumped Flutter web tree for GitHub Pages project-site subpaths."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path


def patch_html(path: Path, base_href: str) -> None:
    text = path.read_text(encoding="utf-8")
    if "<base " not in text.lower():
        text = re.sub(
            r"(<head[^>]*>)",
            rf'\1\n  <base href="{base_href}">',
            text,
            count=1,
            flags=re.IGNORECASE,
        )
    text = re.sub(r'(href|src)="/', r'\1="', text)
    path.write_text(text, encoding="utf-8")


def patch_manifest(path: Path) -> None:
    data = json.loads(path.read_text(encoding="utf-8"))
    if "start_url" in data and data["start_url"].startswith("/"):
        data["start_url"] = data["start_url"].lstrip("/")
    icons = data.get("icons") or []
    for icon in icons:
        src = icon.get("src")
        if isinstance(src, str) and src.startswith("/"):
            icon["src"] = src.lstrip("/")
    path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")


def main() -> None:
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <base-href> <web-root>", file=sys.stderr)
        sys.exit(1)

    base_href = sys.argv[1]
    if not base_href.endswith("/"):
        base_href += "/"

    root = Path(sys.argv[2])
    index = root / "index.html"
    if not index.is_file():
        print(f"Missing {index}", file=sys.stderr)
        sys.exit(1)

    patch_html(index, base_href)

    manifest = root / "manifest.json"
    if manifest.is_file():
        patch_manifest(manifest)


if __name__ == "__main__":
    main()
