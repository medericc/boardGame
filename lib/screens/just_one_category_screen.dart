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
        child: SingleChildScrollView(
          child: gameStarted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: resetGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 163, 230),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: TextStyle(fontSize: 24, inherit: true),
                      ),
                      child: Text('RESET'),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          currentMot,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => nextTurn('success'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          child: Text('Réussi'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => nextTurn('pass'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          child: Text('Passer'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => nextTurn('fail'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          child: Text('Échouer'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Cartes restantes : $cartesRestantes',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Points : $points',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: startGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 163, 230),
                        foregroundColor: Colors.white, // Set the text color to white
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: TextStyle(fontSize: 24, inherit: true),
                      ),
                      child: Text('Lancer'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
