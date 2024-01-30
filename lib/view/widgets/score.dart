import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/controller/providers.dart';
import 'package:tic_tac_toe/model/utils.dart';

class Score extends ConsumerWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreX = ref.watch(playerXScoreProvider);
    final scoreO = ref.watch(playerOScoreProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Utils.imageX,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$scoreX",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Utils.imageO,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$scoreO",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
