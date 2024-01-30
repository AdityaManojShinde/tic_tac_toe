import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/controller/game_controller.dart';
import 'package:tic_tac_toe/controller/providers.dart';
import 'package:tic_tac_toe/model/play_audio.dart';
import 'package:tic_tac_toe/model/utils.dart';

class GameGrid extends ConsumerStatefulWidget {
  const GameGrid({super.key});

  @override
  ConsumerState<GameGrid> createState() => _GameGridState();
}

class _GameGridState extends ConsumerState<GameGrid> {
  @override
  Widget build(BuildContext context) {
    final game = GameController();
    final gameBord = ref.watch(gameBordProvider);
    final playerTurn = ref.watch(playerTurnProvider);

    return GridView.builder(
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            playAudio(Utils.audioClick);
            game.play(index, ref, playerTurn, context);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: gameBord[index].child,
          ),
        );
      },
    );
  }
}
