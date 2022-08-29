# basic_auth_challenge

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## How to enable lint

Run the following command to enable lint

```
dart pub add --dev lints
```

## How to generate translations

Run the following command to generate translations

```
flutter pub run easy_localization:generate -S "assets/translation" -O "lib/src/translations" -o "locale_keys.dart" -f keys
```

Run the following to regenerate .g Files
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

arch -x86_64 pod install




Issues and Suggestions:
1. Remove password from user list