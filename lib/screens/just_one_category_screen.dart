import 'package:flutter/material.dart';
import 'dart:math';

class JustOneCategoryScreen extends StatefulWidget {
  final String categoryName;
  final List<String> mots;

  JustOneCategoryScreen({required this.categoryName, required this.mots});

  @override
  _JustOneCategoryScreenState createState() => _JustOneCategoryScreenState();
}

class _JustOneCategoryScreenState extends State<JustOneCategoryScreen> {
  int points = 0;
  int cartesRestantes = 13;
  List<String> motsRestants = [];
  bool gameStarted = false;

  String currentMot = '';
  String message = '';

  @override
  void initState() {
    super.initState();
    motsRestants = List.from(widget.mots);
    motsRestants.shuffle(Random());
    currentMot = motsRestants.first;
  }

  void startGame() {
    setState(() {
      gameStarted = true;
      cartesRestantes = 13;
      points = 0;
      motsRestants = List.from(widget.mots);
      motsRestants.shuffle(Random());
      currentMot = motsRestants.removeAt(0);
    });
  }

  void stopGame() {
    setState(() {
      gameStarted = false;
      message = "Partie arrêtée. Cliquez sur 'Lancer' pour recommencer.";
    });
  }

  void resetGame() {
    stopGame();
    setState(() {
      message = '';
      gameStarted = false;
      motsRestants = List.from(widget.mots);
      motsRestants.shuffle(Random());
      currentMot = motsRestants.first;
    });
  }

  void nextTurn(String result) {
    setState(() {
      if (result == 'success') {
        points += 1;
      }

      cartesRestantes -= (result == 'fail') ? 2 : 1;

      if (cartesRestantes > 0 && motsRestants.isNotEmpty) {
        currentMot = motsRestants.removeAt(0);
      } else {
        message = "Jeu terminé ! Score final : $points";
        gameStarted = false;
        _showEndGameDialog();
      }
    });
  }

  void _showEndGameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Jeu terminé"),
          content: Text("Score final : $points"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: [
          if (gameStarted)
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: stopGame,
            ),
        ],
      ),
      body: Center(
        child: gameStarted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: resetGame,
                    child: Text('RESET'),
                  ),
                  SizedBox(height: 20),
                  Text('Mot à deviner : $currentMot'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => nextTurn('success'),
                        child: Text('Réussi'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => nextTurn('pass'),
                        child: Text('Passer'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => nextTurn('fail'),
                        child: Text('Échouer'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Cartes restantes : $cartesRestantes'),
                  Text('Points : $points'),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               
                  ElevatedButton(
                    onPressed: startGame,
                    child: Text('Lancer'),
                  ),
                ],
              ),
      ),
    );
  }
}
