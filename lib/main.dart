import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:tictactoe_ispas/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: appRoutes,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

// === GREETING SCREEN ===

class StartScreen extends StatefulWidget {
  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StartScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: NewGradientAppBar(
          centerTitle: true,
          title: const Text(
            'Tic Tac Toe',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF6782b4),
              Color(0xffb1bfd8),
            ],
          ),
        ),
        body: Stack(
          children: [
            _mainContainer(),
            _startButton(),
          ],
        ),
      );

  // === COMPOSITION AND DECOMPOSITION WITH LAMBDA FUNCTIONS ===

  Widget _mainContainer() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5, 1],
            colors: [Color(0xff606c88), Color(0xFF3f4c6b)],
          ),
        ),
      );

  Widget _startButton() => Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            primary: Color(0xFFD4BEAB),
            textStyle: const TextStyle(fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Start',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff606C88),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, '/game'),
        ),
      );
}
