# fidefund

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Hello
To start running project, if you are using VSCode, open terminal and run:
flutter clean
flutter pub get
flutter run
if you are using Android Studio, then use VSCode la.


Project Struture:
- assets folder consist of icons, images, fonts. Just put them in the folder you want
- lib folder consist of all the source code of the project
- we will mainly develop our frontend in lib/screens at respective folder (eg: lib/screens/donate/donate_screen.dart)
- lib/theme contain the app colors, font to reduce hardcoded color value and font type
( there is also spacing.dart, but i think can skip because most of our spacing are different values)


How to use app colors:
color: AppColors.primaryBlue;


How to use font type:
text = AppTypography.textStyle(fontSize: 12, fontWeight: light, fontStyle: FontStyle.italic, color: AppColors.grey);text = AppTypography.bodyLarge;


If you see this error, just ignore it:
Building with plugins requires symlink support.
Please enable Developer Mode in your system settings. Run
  start ms-settings:developers
to open settings.