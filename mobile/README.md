# cardnest_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Firebase Setup

This project uses Firebase for authentication. To set it up, you need to configure Firebase for your specific application environments (Android, iOS).

1. Ensure you have the [Firebase CLI](https://firebase.google.com/docs/cli) installed and logged in (`firebase login`).
2. Install the FlutterFire CLI: `dart pub global activate flutterfire_cli`.
3. Run the FlutterFire configuration command at the root of the `mobile` project:
   ```bash
   flutterfire configure
   ```
4. Follow the prompts to select your Firebase project and configure the target platforms (Android, iOS). This will automatically update your Android/iOS setup files and generate `lib/firebase_options.dart`.

After setup, make sure to enable **Phone Authentication** in the Firebase Console under Authentication -> Sign-in methods.
