import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/controller/game_controller.dart';
import 'package:tic_tac_toe/controller/providers.dart';
import 'package:tic_tac_toe/view/widgets/game_grid.dart';
// ignore: unused_import
import 'package:tic_tac_toe/view/widgets/score.dart';

class PvPScreen extends ConsumerWidget {
  const PvPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Score(),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: SizedBox(
            height: 300,
            width: 300,
            child: GameGrid(),
          ),
        ),
      ],
    );
    final game = GameController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          game.resetGame(ref);
          ref.read(playerOScoreProvider.notifier).update((state) => 0);
          ref.read(playerXScoreProvider.notifier).update((state) => 0);
        },
        child: const Icon(Icons.restore),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(playerOScoreProvider.notifier).update((state) => 0);
              ref.read(playerXScoreProvider.notifier).update((state) => 0);
              context.go('/');
              game.resetGame(ref);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: OrientationBuilder(builder: (context, orentation) {
        if (orentation == Orientation.landscape) {
          content = const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Score(),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: GameGrid(),
              ),
            ],
          );
          return content;
        } else {
          content = const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Score(),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: GameGrid(),
                ),
              ),
            ],
          );
        }
        return content;
      }),
    );
  }
}
