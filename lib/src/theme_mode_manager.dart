part of dynamic_theme_mode;

///
/// {@template theme_mode_manager}
/// Holds a [ThemeMode] value, and notify it's listeners
/// when this value changes.
/// {@endtemplate}
///
class ThemeModeManager {
  /// {@macro theme_mode_manager}
  ThemeModeManager._({
    required ThemeMode initialThemeMode,
  }) : this._notifier = _ThemeModeManagerNotifier(initialThemeMode);

  final _ThemeModeManagerNotifier _notifier;

  /// The current [ThemeMode] value.
  ThemeMode get themeMode => _notifier.value;

  /// Set the [themeMode] value to [ThemeMode.system] and notify the listeners.
  void useSystemMode() => setThemeMode(ThemeMode.system);

  /// Set the [themeMode] value to [ThemeMode.light] and notify the listeners.
  void useLightMode() => setThemeMode(ThemeMode.light);

  /// Set the [themeMode] value to [ThemeMode.dark] and notify the listeners.
  void useDarkMode() => setThemeMode(ThemeMode.dark);

  /// Set the [themeMode] to [value] and notify the listeners.
  void setThemeMode(ThemeMode value) => _notifier.changeValue(value);
}
