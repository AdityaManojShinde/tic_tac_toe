import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/model/play_audio.dart';
import 'package:tic_tac_toe/model/utils.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          context.go('/settings');
        },
        child: const Icon(Icons.settings),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Utils.imageIcon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Play With Your Friend',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  playAudio(Utils.audioClick);
                  context.go('/pvp');
                },
                child: const Text('Play')),
          )
        ],
      ),
    );
  }
}
