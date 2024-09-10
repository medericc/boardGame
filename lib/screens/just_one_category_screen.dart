import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';

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
bool _motVisible = true;

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
        _showEndGameDialog(points);
      }
    });
  }

void _showEndGameDialog(int points) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // Détermination du message en fonction des points
      String message;
      if (points >= 0 && points < 5) {
        message = "T'es mauvais";
      } else if (points >= 5 && points < 10) {
        message = "T'y es presque";
      } else if (points >= 10 && points < 13) {
        message = "Un peu d'effort";
      } else {
        message = "Félicitations !";
      }

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Titre avec icône
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events, color: Colors.amber, size: 40),
                  SizedBox(width: 10),
                  Text(
                    message, // Affichage du message dynamique
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Affichage des points
              Text(
                "Vous avez marqué",
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              Text(
                "$points points",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Boutons pour rejouer ou quitter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      startGame();
                    },
                    icon: Icon(Icons.refresh, color: Colors.white),
                    label: Text("Rejouer"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
                  GestureDetector(
  onTap: () {
    setState(() {
      _motVisible = !_motVisible; // Bascule la visibilité
    });
  },
  child: Container(
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
        _motVisible ? currentMot : "", // Affiche le mot si visible, sinon rien
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _motVisible ? Colors.black : Colors.blue, // Bleu si caché
        ),
      ),
    ),
  ),
),

                    SizedBox(height: 20),
                    // Disposition des boutons en forme de triangle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => nextTurn('success'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                textStyle: TextStyle(fontSize: 24),
                              ),
                              child: Text('Réussi'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => nextTurn('fail'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          child: Text('Échouer'),
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
                        foregroundColor: Colors.white,
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
