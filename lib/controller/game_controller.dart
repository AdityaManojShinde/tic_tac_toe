// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/controller/providers.dart';
import 'package:tic_tac_toe/model/models.dart';
import 'package:tic_tac_toe/model/show_dialog.dart';

import 'package:tic_tac_toe/model/utils.dart';

class GameController {
  GameController();

  final playerX = Box(
    id: 'X',
    child: SizedBox(
      child: Utils.imageX,
    ),
  );

  final playerO = Box(
    id: 'O',
    child: SizedBox(
      child: Utils.imageO,
    ),
  );

  void scoreReset(WidgetRef ref) {
    ref.read(playerXScoreProvider.notifier).update((state) => 0);
    ref.read(playerOScoreProvider.notifier).update((state) => 0);
  }

  void resetGame(WidgetRef ref) {
    ref
        .read(gameBordProvider.notifier)
        .update((state) => List.generate(9, (index) => Box()));
  }

  void play(int index, WidgetRef ref, bool playerTurn, BuildContext ctx) {
    final bord = ref.watch(gameBordProvider);
    if (playerTurn) {
      // Player X turn
      ref
          .read(gameBordProvider.notifier)
          .update((state) => state = state..[index] = playerX);

      //change turn
      ref.read(playerTurnProvider.notifier).update((state) => !playerTurn);
      //check if player won
      checkWin(ref, ctx);
    } else if (!playerTurn) {
      // Player O turn
      ref
          .read(gameBordProvider.notifier)
          .update((state) => state = state..[index] = playerO);

      //change turn
      ref.read(playerTurnProvider.notifier).update((state) => !playerTurn);
      //check if player won
      checkWin(ref, ctx);
    }
  }

  void boxColorChanger(List<int> index, WidgetRef ref, String player) {
    for (int i in index) {
      ref.read(gameBordProvider.notifier).update(
            (state) => state = state
              ..[i] = Box(
                id: 'x',
                child: Container(
                  color: Colors.greenAccent,
                  child: Image.asset(
                    'assets/images/$player.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          );
    }
  }

  void playerWins(List<int> box, String turn, WidgetRef ref, BuildContext ctx) {
    if (turn == 'X') {
      boxColorChanger(box, ref, 'x');
      ref.read(playerXScoreProvider.notifier).state++;
      showCustomDialogBox(Utils.playerXWinMessage, ref, ctx);
    } else if (turn == 'O') {
      boxColorChanger(box, ref, 'o');
      ref.read(playerOScoreProvider.notifier).state++;
      showCustomDialogBox(Utils.playerOWinMessage, ref, ctx);
    }
  }

  void checkWin(WidgetRef ref, BuildContext ctx) {
    final gameBord = ref.read(gameBordProvider);

    if (gameBord[0].id != '' &&
        gameBord[0].id == gameBord[1].id &&
        gameBord[1].id == gameBord[2].id) {
      playerWins([0, 1, 2], gameBord[0].id, ref, ctx);
    } else if (gameBord[3].id != '' &&
        gameBord[3].id == gameBord[4].id &&
        gameBord[4].id == gameBord[5].id) {
      playerWins([3, 4, 5], gameBord[3].id, ref, ctx);
    } else if (gameBord[6].id != '' &&
        gameBord[6].id == gameBord[7].id &&
        gameBord[7].id == gameBord[8].id) {
      playerWins([6, 7, 8], gameBord[6].id, ref, ctx);
    } else if (gameBord[0].id != '' &&
        gameBord[0].id == gameBord[3].id &&
        gameBord[3].id == gameBord[6].id) {
      playerWins([0, 3, 6], gameBord[0].id, ref, ctx);
    } else if (gameBord[1].id != '' &&
        gameBord[1].id == gameBord[4].id &&
        gameBord[4].id == gameBord[7].id) {
      playerWins([1, 4, 7], gameBord[1].id, ref, ctx);
    } else if (gameBord[2].id != '' &&
        gameBord[2].id == gameBord[5].id &&
        gameBord[5].id == gameBord[8].id) {
      playerWins([2, 5, 8], gameBord[2].id, ref, ctx);
    } else if (gameBord[0].id != '' &&
        gameBord[0].id == gameBord[4].id &&
        gameBord[4].id == gameBord[8].id) {
      playerWins([0, 4, 8], gameBord[0].id, ref, ctx);
    } else if (gameBord[6].id != '' &&
        gameBord[6].id == gameBord[4].id &&
        gameBord[4].id == gameBord[2].id) {
      playerWins([6, 4, 2], gameBord[6].id, ref, ctx);
    } else if (gameBord.every((element) => element.id != '')) {
      showCustomDialogBox(Utils.playerDrawMessage, ref, ctx);
    }
  }
}
