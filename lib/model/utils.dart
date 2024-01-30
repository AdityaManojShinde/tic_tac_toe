import 'package:flutter/material.dart';

class Utils {
  static const String appTitle = 'Tie Tac Toe';
  static const String playerXWinMessage = '🥳 Player X Wins!';
  static const String playerOWinMessage = '🥳 Player O Wins!';
  static const String playerDrawMessage = '😅 Draw! Try again';
  static const String audioClick = "sfx/click.mp3";
  static const String audioWin = "sfx/cel.mp3";
  static const String playstoreUrl =
      "https://play.google.com/store/apps/dev?id=5752398750099521659";
  static const String privacyPolicyUrl =
      "https://www.freeprivacypolicy.com/live/152f4be1-4c44-47f1-9747-e4ef5b3f3d40";
  static const Color seedColor = Colors.blue;
  static const Color greenColor = Colors.greenAccent;

  static final Image imageX = Image.asset(
    'assets/images/x.png',
    fit: BoxFit.cover,
  );
  static final Image imageO = Image.asset(
    'assets/images/o.png',
    fit: BoxFit.cover,
  );

  static final Image imageIcon = Image.asset(
    'assets/images/game.png',
    fit: BoxFit.cover,
  );
}
