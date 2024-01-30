import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/controller/game_controller.dart';
import 'package:tic_tac_toe/model/play_audio.dart';
import 'package:tic_tac_toe/model/utils.dart';

void showCustomDialogBox(String message, WidgetRef ref, BuildContext ctx) {
  playAudio(Utils.audioWin);
  AwesomeDialog(
    customHeader: const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(
        'assets/images/party.gif',
      ),
    ),
    dismissOnTouchOutside: false,
    context: ctx,
    dialogType: DialogType.info,
    animType: AnimType.scale,
    title: '',
    desc: message,
    btnOkOnPress: () {
      final game = GameController();
      game.resetGame(ref);
    },
  ).show();
}
