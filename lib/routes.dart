import 'package:tictactoe_ispas/main.dart';
import 'package:tictactoe_ispas/screens/gameScreen.dart';

// === USING NAVIGATOR 1.0 ===

var appRoutes = {
  '/': (context) => const StartScreen(),
  '/game': (context) => const GameScreen(),
};
