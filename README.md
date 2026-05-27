# nin_guide

A new Flutter project.

## Natur i Norge (NiN) Guide

App for mapping and identifying nature types in Norway.

## Landing Page, Web App & Privacy Policy

The project includes a landing page and privacy policy in the `docs/` directory. The Flutter web build is published under `docs/app/`.

GitHub Pages is configured to serve from **`main` / `docs`**. The landing page is at:

`https://geco-nhm.github.io/natur-i-norge/`

The web app is at:

`https://geco-nhm.github.io/natur-i-norge/app/`

### Build and deploy the web app

```bash
# Build only (output in docs/app/)
./publish.sh web

# Build, commit, and push to GitHub Pages
./publish.sh web --deploy

# Preview locally before deploying
python3 -m http.server 8080 --directory docs
# open http://localhost:8080/app/
```

To publish mobile stores and build web in one go:

```bash
./publish.sh all --deploy
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
