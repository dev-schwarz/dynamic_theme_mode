import 'package:dynamic_theme_mode/dynamic_theme_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DynamicThemeMode(
    initialThemeMode: ThemeMode.system,
    builder: (context, themeMode) => ExampleApp(themeMode: themeMode),
  ));
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({
    Key? key,
    required this.themeMode,
  }) : super(key: key);

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        textTheme: ThemeData().textTheme.apply(
              displayColor: Colors.indigo,
            ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        textTheme: ThemeData().textTheme.apply(
              displayColor: Colors.red,
            ),
      ),
      themeMode: this.themeMode,
      home: ExampleHome(),
    );
  }
}

class ExampleHome extends StatelessWidget {
  const ExampleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeModeManager manager = DynamicThemeMode.managerOf(context);

    final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width / 2.5),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DynamicThemeMode Example'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${manager.themeMode}',
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(
                child: const Text('System mode'),
                style: buttonStyle,
                onPressed: manager.useSystemMode,
              ),
              ElevatedButton(
                child: const Text('Light mode'),
                style: buttonStyle,
                onPressed: () => manager.setThemeMode(ThemeMode.light),
              ),
              ElevatedButton(
                child: const Text('Dark mode'),
                style: buttonStyle,
                onPressed: manager.useDarkMode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
