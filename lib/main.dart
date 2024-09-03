import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(JustOneApp());
}

class JustOneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juste Un',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    JustOneCategoryScreen(categoryName: 'Célébrité', mots: [
      "Brad Pitt", "Beyoncé", "Albert Einstein", "Marilyn Monroe", "Charlie Chaplin",
      "Elvis Presley", "Lady Gaga", "Leonardo da Vinci", "Michael Jackson", "Tom Cruise",
      "Oprah Winfrey", "Madonna", "Walt Disney"
    ]),
    JustOneCategoryScreen(categoryName: 'Géographie', mots: [
      "Paris", "Mont Everest", "Amazonie", "Sahara", "Nile",
      "Alpes", "Antarctique", "Syndey", "Tokyo", "Grand Canyon",
      "Himalaya", "Niagara Falls", "New York"
    ]),
    JustOneCategoryScreen(categoryName: 'Global', mots: [
      "Internet", "Téléphone", "Ordinateur", "Révolution industrielle", "Démocratie",
      "Fusée", "Avion", "Espace", "Intelligence Artificielle", "Bitcoin",
      "Énergie solaire", "Vaccin", "Satellite"
    ]),
    JustOneCategoryScreen(categoryName: 'Sportif', mots: [
      "Football", "Basketball", "Tennis", "Natation", "Ski",
      "Marathon", "Cyclisme", "Gymnastique", "Golf", "Rugby",
      "Cricket", "Boxe", "Formule 1"
    ]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juste Un'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Célébrité',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Géographie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Global',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Sportif',
          ),
        ],
      ),
    );
  }
}

// Écran d'accueil avec les règles du jeu
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue à Juste Un!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Règles du jeu :\n'
              '1. Un joueur doit deviner un mot sans le voir.\n'
              '2. Les autres joueurs écrivent un indice chacun, mais ils ne doivent pas être identiques.\n'
              '3. Si le devineur trouve le mot, l\'équipe gagne un point. Sinon, elle perd un point.\n'
              '4. Utilisez les différentes catégories pour des thèmes variés!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Écran de catégorie générique avec le jeu Juste Un
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
  int indexMot = 0;
  bool gameStarted = false;

  late String currentMot;
  String message = '';

  @override
  void initState() {
    super.initState();
    widget.mots.shuffle(Random());
    currentMot = widget.mots[indexMot];
  }

  void startGame() {
    setState(() {
      gameStarted = true;
      cartesRestantes = 13;
      points = 0;
      indexMot = 0;
      currentMot = widget.mots[indexMot];
    });
  }

  void nextTurn(String result) {
    setState(() {
      if (result == 'success') {
        points += 1;
        cartesRestantes -= 1;
      } else if (result == 'fail') {
        
        cartesRestantes -= 2; 
      } else if (result == 'pass') {
        cartesRestantes -= 1;
      }

      if (cartesRestantes > 0) {
        indexMot += 1;
        currentMot = widget.mots[indexMot % widget.mots.length];
      } else {
        message = "Jeu terminé ! Score final : $points";
        gameStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: gameStarted
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Text('Bienvenue à ${widget.categoryName} !'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: startGame,
                  child: Text('Lancer'),
                ),
              ],
            ),
    );
  }
}
