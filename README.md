# UI Playground — Shop UI (Flutter)

A Flutter UI playground built for the **PCPS** coursework. It is a small
e-commerce demo app whose purpose is to showcase core Flutter UI building
blocks: layouts, widgets, images, fonts and icons, plus scroll views and a
product flow (splash → onboarding → login → demo menu → list/grid/detail).

Repo: <https://github.com/MILANydv/UiPlaygroud_PCPS>

## Screens

| Screen | File |
| --- | --- |
| Splash | `lib/screens/splash_screen.dart` |
| Onboarding | `lib/screens/onboarding_screen.dart` |
| Login | `lib/screens/login_screen.dart` |
| Demo menu | `lib/screens/widgets_gallery_screen.dart` |
| List view | `lib/screens/product_list_screen.dart` |
| Grid view | `lib/screens/product_grid_screen.dart` |
| Product detail | `lib/screens/product_detail_screen.dart` |
| Layout playground | `lib/screens/layout_screen.dart` |
| Scroll views | `lib/screens/scroll_views_screen.dart` |
| Images | `lib/screens/images_screen.dart` |
| Fonts and icons | `lib/screens/typography_screen.dart` |

## Requirements

- Flutter **3.41.x** (stable) with Dart **3.11+** — `environment.sdk: ^3.11.0`
- Android Studio (Android SDK) or Xcode (iOS)

Check your install:

```bash
flutter --version
flutter doctor
```

## Clone

```bash
git clone https://github.com/MILANydv/UiPlaygroud_PCPS.git
cd UiPlaygroud_PCPS
```

Clone this README directly without cloning the repo:

```bash
curl -fsSL https://raw.githubusercontent.com/MILANydv/UiPlaygroud_PCPS/main/README.md
```

## Install dependencies

```bash
flutter pub get
```

## Run

Pick a target first (`flutter devices`), then:

```bash
# Android emulator or attached phone
flutter run -d android

# iOS simulator (macOS only)
open -a Simulator
flutter run -d ios

# Desktop
flutter run -d macos      # or: flutter run -d chrome
```

## Build

```bash
flutter build apk --release       # Android APK  -> build/app/outputs/flutter-apk/
flutter build appbundle --release # Android AAB  -> build/app/outputs/bundle/release/
flutter build ios --release       # iOS          -> build/ios/iphoneos/
flutter build web                 # Web          -> build/web/
```

## Test, analyze and format

```bash
flutter analyze           # static analysis (flutter_lints)
flutter test              # widget tests in test/widget_test.dart
dart format .             # format the code
```

`flutter test` walks the whole flow: splash → onboarding → login → demo menu,
then opens list, grid, detail, scroll views, images and typography pages.

## Project structure

```
lib/
  main.dart              # App entry point and MaterialApp theme
  data/products.dart     # Static product catalog
  models/product.dart    # Product model
  screens/               # One file per screen
  widgets/               # Reusable widgets (cards, tiles, headers)
assets/
  fonts/                 # Poppins 400/500/600/700
  images/                # Product and banner images
test/widget_test.dart    # Widget tests
```

## Troubleshooting

- **`flutter pub get` fails on SDK** — your Flutter is older than 3.41; update
  with `flutter upgrade`.
- **Fonts do not look like Poppins** — run `flutter clean` then
  `flutter pub get`, the fonts are declared in `pubspec.yaml`.
- **Gradle / Java errors on Android** — check `flutter doctor`, accept the
  Android SDK licenses and make sure `JAVA_HOME` points to JDK 17+.
- **iOS build fails** — run `pod install` inside `ios/` and open
  `ios/Runner.xcworkspace` instead of the `.xcodeproj`.
- **Nothing renders after an update** — `flutter clean && flutter pub get`.
