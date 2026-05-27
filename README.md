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

# Preview locally before deploying (mirrors GitHub Pages URL paths)
./scripts/preview_web.sh
# open http://localhost:8080/natur-i-norge/app/
```

To publish mobile stores and build web in one go:

```bash
./publish.sh all --deploy
```

### Firebase Storage CORS (required for web photos)

The web app loads observation images from Firebase Storage. Browsers block those
requests unless the storage bucket allows your site's origin.

One-time setup (requires [Google Cloud SDK](https://cloud.google.com/sdk) and access to the `natur-i-norge-guide` project):

```bash
gcloud auth login
gcloud config set project natur-i-norge-guide
chmod +x scripts/configure_storage_cors.sh
./scripts/configure_storage_cors.sh
```

This applies `firebase/storage-cors.json`, allowing GitHub Pages and local preview.
Changes usually take effect within a few minutes.

If you develop with `flutter run -d chrome` on a different port, add that origin to
`firebase/storage-cors.json` and re-run the script.

Also ensure **Firebase Console → Authentication → Settings → Authorized domains**
includes `geco-nhm.github.io` and `localhost`.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
