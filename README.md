# dynamic_theme_mode

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->

[![version][version-badge]][package]
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

<!-- ALL-CONTRIBUTORS-BADGE:END -->

A Flutter widget that allows theme mode changing during runtime.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  dynamic_theme_mode: ^1.0.0
```

## Usage

- Import the `DynamicThemeMode` widget, wrap `MaterialApp` with it and pass an initial `ThemeMode` value.

```dart
import 'package:dynamic_theme_mode/dynamic_theme_mode.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return DynamicThemeMode(
      initialThemeMode: ThemeMode.system,
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.orange,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.yellow,
          ),
          // Here we use the themeMode dynamic value!
          themeMode: themeMode,
          home: ExampleHome(),
        );
      },
    );
  }
}
```

- Change the `themeMode` to use with:

```dart
DynamicThemeMode.managerOf(context)?.useDarkMode();
// Or
DynamicThemeMode.managerOf(context)?.setThemeMode(ThemeMode.light);
```

- Get the current `themeMode` value with:

```dart
DynamicThemeMode.managerOf(context)?.value;
```

The `example` folder has a complete example!

## API

### builder

Type: `Widget Function(BuildContext context, ThemeMode themeMode)`.

Method that runs to rebuild the tree when `themeMode` changes.

### manager

Type: `ThemeModeManager`.

Holds a `ThemeMode` value and notifies when it changes, also, it
has the methods that changes the `themeMode`.

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/dev-schwarz"><img src="https://avatars0.githubusercontent.com/u/72122596?v=4" width="100px;" alt=""/><br /><sub><b>Carlos Schwarz</b></sub></a><br /><a href="https://github.com/dev-schwarz/dynamic_theme_mode/commits?author=dev-schwarz" title="Code">💻</a> <a href="#design-dev-schwarz" title="Design">🎨</a> <a href="#example-dev-schwarz" title="Examples">💡</a> <a href="#maintenance-dev-schwarz" title="Maintenance">🚧</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## License

MIT © [Carlos Schwarz](https://github.com/dev-schwarz/)

[version-badge]: https://img.shields.io/pub/v/dynamic_theme_mode?style=flat-square
[package]: https://pub.dev/packages/dynamic_theme_mode