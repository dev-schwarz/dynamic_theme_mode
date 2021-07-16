part of dynamic_theme_mode;

class _DynamicThemeModeInheritedWidget extends InheritedWidget {
  const _DynamicThemeModeInheritedWidget({
    Key? key,
    required this.manager,
    required Widget child,
  }) : super(key: key, child: child);

  final ThemeModeManager manager;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget is _DynamicThemeModeInheritedWidget &&
      manager.themeMode != oldWidget.manager.themeMode;
}
