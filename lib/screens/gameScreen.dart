import 'package:flutter/material.dart';
import 'package:tictactoe_ispas/shared/customStyled.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfX = true;
  int _filledBoxes = 0;
  final List<String> _xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) => _scaffold(children: [
        _pointsTable(),
        _buildGrid(),
        _buildTurn(),
      ]);

  // === BUILDING THE MAIN LAYOUT ===

  Widget _scaffold({required List<Widget> children}) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[900],
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
          title: Text(
            'Tic Tac Toe',
            style: CustomText(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          children: children,
        ),
      );

  // === POINTS TABLE ===

  Widget _pointsTable() => Expanded(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _playerXScore(),
              _playerOScore(),
            ],
          ),
        ),
      );

  Widget _playerName(String name) => Text(
        'Player $name',
        style: CustomText(
            fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.w800),
      );

  Widget _playerScore(int score) => Text(
        score.toString(),
        style: CustomText(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      );

  Widget _spacer() => const SizedBox(
        height: 20,
      );

  Widget _playerXScore() => Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          children: [
            _playerName('X'),
            _spacer(),
            _playerScore(_scoreX),
          ],
        ),
      );

  Widget _playerOScore() => Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          children: [
            _playerName('O'),
            _spacer(),
            _playerScore(_scoreO),
          ],
        ),
      );

  // === BUILD GRID ===

  Widget _buildGrid() => Expanded(
        flex: 3,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700),
                  ),
                  child: Center(
                    child: Text(
                      _xOrOList[index],
                      style: TextStyle(
                        color:
                            _xOrOList[index] == 'x' ? Colors.white : Colors.red,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );

  // === BUILD TURN ===

  Widget _buildTurn() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            _turnOfX ? 'Turn of X' : 'Turn of O',
            style: CustomText(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
