# {{project_name.titleCase()}}

Generated by the [Very Good CLI][very_good_cli_link] 🤖

{{description}}

---

## Getting Started 🚀

### If IntelliJ/AndroidStudio refuses to load the project properly

go to `File -> Project Structure -> Modules -> + -> Import Module`  
and select the project folder


### Install the dependencies
```sh
$ fvm flutter pub get
```

### Generate the assets
```sh
$ fvm dart run build_runner build --delete-conflicting-outputs
```

### make iOS compilation work
add `platform :ios, '12.0'` to Podfile and remove RunnerTest in `target 
'Runner' do`

otherwise iOS will whine about the minimum deployment target and the tests

also add 
```
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end

```
in post_install in Podfile

### Adapt theme

- change the colors in assets/color/colors_light.xml
- change the theme in lib/presentation/ui/theme/light_theme.dart

## General Information
This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_dev.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_prod.dart
```

_\*{{project_name.titleCase()}} works on iOS and Android._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [easy_localization][flutter_localizations_link].

### Adding Strings

1. To add a new localizable string, open the `de-DE.json` file at `assets/translations/de-DE.json`.

```
{
    "counterAppBarTitle": "Zähler",
    "home": {
        "title": "Home"
    } 
}
```

2. Then add a new key/value and description

```
{
    "counterAppBarTitle": "Zähler",
    "home": {
        "title": "Home"
        "garden_feed": "Garten Feed",
    } 
}
```

3. Use the new string

```dart
import 'package:easy_localization/easy_localization.dart';

@override
Widget build(BuildContext context) {
  return Text('home.garden_section'.tr());
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>de</string>
		<string>en</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new JSON file in `assets/translations`.

```
├── assets
│   ├── translations
│   │   ├── de-DE.json
│   │   └── en-US.json
```

2. Add the translated strings to each `.json` file:

`en-US.json`

```json
{
    "counterAppBarTitle": "Counter",
    "home": {
        "title": "Home",
        "garden_feed": "Garden Feed"
    } 
}
```

`de-DE.json`

```json
{
    "counterAppBarTitle": "Zähler",
    "home": {
        "title": "Startseite",
        "garden_feed": "Garten Feed"
    } 
}
```

---

## Adding image assets

To use the latest asset changes, you will need to generate them:

1. Generate assets for the current project:

```sh
$ dart run build_runner build --delete-conflicting-outputs
```

Lazy people can add an alias to their .zshrc or .bashrc:

```sh
alias brun='dart run build_runner build --delete-conflicting-outputs'
```

You can then use the Assets by getting them from the `Assets` class.

Colors are also available in the `ColorName` class.


```dart
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      GardenFeedCard(
        image: Assets.images.placeholder.salad.image(fit: BoxFit.fill),
        user: Assets.images.placeholder.person1.image(),
        online: true,
      ),
      Assets.images.mascots.blueberry.svg(),
      Icon(
        Ionicons.partly_sunny_outline,
        color: ColorName.black,
      ),
    ],
  );
}
```

---

## Mason
To add new Views, use the [Mason CLI][mason_link]

### 🎯 Activate from https://pub.dev
```sh
$ dart pub global activate mason_cli
```
### 📁 Initialize mason in the current workspace id there is no existing mason.yaml
```sh
$ mason init
```
### 📦 Get all bricks for the current project
```sh
$ mason get
```
### 🗂 List all installed local Bricks
```sh
$ mason list
```
### 🚧 Generate code from a brick
```sh
$ cd lib/presentation
$ mason make view

# or when you are in the root folder
$ mason make view -o ./lib/presentation
```
The Brick will then ask you for the name of the new View.

If you want to create your own bricks, follow the [Mason Documentation][mason_create_link]

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://pub.dev/packages/easy_localization
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
[mason_link]: https://docs.brickhub.dev/
[mason_create_link]: https://docs.brickhub.dev/category/creating-bricks
