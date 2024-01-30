import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/model/models.dart';

final gameBordProvider =
    StateProvider<List<Box>>((ref) => List.generate(9, (index) => Box()));

final playerTurnProvider = StateProvider<bool>((ref) => true);

final playerXScoreProvider = StateProvider<int>((ref) => 0);
final playerOScoreProvider = StateProvider<int>((ref) => 0);
