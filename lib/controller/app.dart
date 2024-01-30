import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/router.dart';
import 'package:tic_tac_toe/model/theme.dart';
import 'package:tic_tac_toe/model/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: Utils.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
