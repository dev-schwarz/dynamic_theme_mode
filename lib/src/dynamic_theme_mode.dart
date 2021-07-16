part of dynamic_theme_mode;

///
/// {@template dynamic_theme_mode}
/// Widget that manages the [ThemeMode] for the app, and allow it's value
/// changes, automatically applying them.
/// {@endtemplate}
///
class DynamicThemeMode extends StatefulWidget {
  /// {@macro dynamic_theme_mode}
  const DynamicThemeMode({
    Key? key,
    required this.initialThemeMode,
    required this.builder,
  }) : super(key: key);

  /// The initial [ThemeMode] value.
  final ThemeMode initialThemeMode;

  /// Method that runs to rebuild the tree when [ThemeMode] value changes.
  final Widget Function(BuildContext context, ThemeMode themeMode) builder;

  @override
  _DynamicThemeModeState createState() => _DynamicThemeModeState();

  /// The data from the closest [ThemeModeManager] instance that encloses the
  /// giver context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TextButton(
  ///   child: Text('Use dart theme mode'),
  ///   onPressed: () {
  ///     DynamicThemeMode.managerOf(context).useDarkMode();
  ///   }
  /// )
  /// ```
  static ThemeModeManager managerOf(BuildContext context) {
    final _DynamicThemeModeInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<_DynamicThemeModeInheritedWidget>();
    assert(result != null, 'No ThemeModeManager in context');
    return result!.manager;
  }
}

class _DynamicThemeModeState extends State<DynamicThemeMode> {
  late final ThemeModeManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = ThemeModeManager._(initialThemeMode: widget.initialThemeMode);
  }

  @override
  void dispose() {
    _manager._notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DynamicThemeModeInheritedWidget(
      key: widget.key,
      manager: _manager,
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: _manager._notifier,
            builder: (context, value, child) {
              final current = DynamicThemeMode.managerOf(context).themeMode;
              return widget.builder(context, current);
            },
          );
        },
      ),
    );
  }
}
