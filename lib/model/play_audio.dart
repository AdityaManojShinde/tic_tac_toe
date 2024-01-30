import 'package:audioplayers/audioplayers.dart';

Future<void> playAudio(String audioPath) async {
  final player = AudioPlayer();
  await player.play(AssetSource(audioPath));
}
