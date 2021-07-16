part of dynamic_theme_mode;

///
/// {@template theme_mode_notifier}
/// Holds a [ThemeMode] value, and notify it's listeners
/// when this value changes.
/// {@endtemplate}
///
class _ThemeModeManagerNotifier extends ValueNotifier<ThemeMode> {
  /// {@macro theme_mode_notifier}
  _ThemeModeManagerNotifier(ThemeMode value) : super(value);

  /// Change the [ThemeMode] value and notify it's listeners.
  void changeValue(ThemeMode value) {
    if (this.value == value) return;

    this.value = value;
    notifyListeners();
  }
}
