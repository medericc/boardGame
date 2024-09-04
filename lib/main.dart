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
  "Brad", "Beyoncé", "Einstein", "Marilyn", "Chaplin",
  "Elvis", "Gaga", "Leonardo", "Michael", "Tom",
  "Oprah", "Madonna", "Disney", "Adele", "Rihanna",
  "Shakira", "Drake", "Mick", "Prince", "Eminem",
  "Cher", "Sting", "Zayn", "Usher", "Shakira",
  "Whitney", "Pink", "Sia", "Nas", "Kanye",
  "Jay-Z", "Bono", "JLo", "Cardi", "Pitbull",
  "Zendaya", "Scarlett", "Bieber", "Selena", "Dua",
  "Lizzo", "TheRock", "Hulk", "Spock", "Bond",
  "Mickey", "Thor", "Quincy", "Oprah", "Winfrey",
  "Gandhi", "Tesla", "Picasso", "Freud", "Jobs",
  "Gates", "Branson", "Zuckerberg", "Musk", "Buffett",
  "Oprah", "Cher", "Snoop", "Bono", "Luther",
  "Newton", "Plato", "Aristotle", "Buddha", "Confucius",
  "Washington", "Lincoln", "Churchill", "Napoleon", "Caesar",
  "Cleopatra", "Tutankhamun", "Shakespeare", "Mozart", "Beethoven",
  "Chopin", "Dali", "VanGogh", "Rembrandt", "Warhol",
  "Hitchcock", "Spielberg", "Kubrick", "Tarantino", "Nolan",
  "Hemingway", "Rowling", "Tolkien", "Orwell", "Dickens"
]),

   JustOneCategoryScreen(categoryName: 'Géographie', mots: [
  "Paris", "Everest", "Amazonie", "Sahara", "Nile",
  "Alpes", "Antarctique", "Sydney", "Tokyo", "Canyon",
  "Himalaya", "Niagara", "York", "London", "Berlin",
  "Madrid", "Rome", "Cairo", "Moscow", "Beijing",
  "Lagos", "Dubai", "Bangkok", "Istanbul", "Toronto",
  "Shanghai", "Delhi", "Miami", "Chicago", "Lisbon",
  "Vienna", "Munich", "Venice", "Florence", "Athens",
  "Jerusalem", "Milan", "Barcelona", "Zurich", "Geneva",
  "Dubai", "Seoul", "Osaka", "Jakarta", "Manila",
  "Kabul", "Karachi", "Tehran", "Baghdad", "Riyadh",
  "Casablanca", "Dakar", "Nairobi", "Lima", "Quito",
  "Brasilia", "Buenos", "Santiago", "Bogota", "Caracas",
  "Havana", "Montevideo", "Asuncion", "Paramaribo", "Georgetown",
  "Bridgetown", "Kingston", "Managua", "SanJose", "Panama",
  "Honduras", "Tegucigalpa", "Guatemala", "Belize", "Mexicali",
  "Cancun", "Tijuana", "Puebla", "Hermosillo", "Monterrey",
  "Phoenix", "Houston", "Dallas", "Atlanta", "Seattle",
  "Portland", "LasVegas", "Denver", "SaltLake", "Anchorage",
  "Honolulu", "Fairbanks", "Sydney", "Melbourne", "Brisbane",
  "Perth", "Adelaide", "Darwin", "Auckland", "Wellington",
  "Canberra", "Hobart", "Oslo", "Stockholm", "Helsinki",
  "Copenhagen", "Reykjavik", "Tallinn", "Riga", "Vilnius",
  "Warsaw", "Prague", "Budapest", "Bucharest", "Sofia",
  "Belgrade", "Zagreb", "Sarajevo", "Ljubljana", "Skopje",
  "Tirana", "Athens", "Valletta", "Nicosia", "Ankara",
  "Istanbul", "Jerusalem", "Amman", "Beirut", "Damascus",
  "Doha", "AbuDhabi", "Muscat", "Sanaa", "Maputo",
  "Harare", "Kigali", "Lusaka", "Gaborone", "Windhoek",
  "Bamako", "Ouagadougou", "Niamey", "N'Djamena", "Juba",
  "Khartoum", "Addis", "Asmara", "Djibouti", "Mogadishu",
  "Victoria", "Moroni", "Antananarivo", "PortLouis", "Pretoria",
  "CapeTown", "Durban", "Kinshasa", "Brazzaville", "Libreville",
  "Malabo", "Luanda", "Bangui", "Kinshasa", "Yaoundé",
  "Douala", "Libreville", "PortoNovo", "Cotonou", "Lome",
  "Accra", "Kumasi", "Abidjan", "Yamoussoukro", "Monrovia"
]),

    JustOneCategoryScreen(categoryName: 'Global', mots: [
  "Internet", "Téléphone", "Ordinateur", "Révolution", "Démocratie",
  "Fusée", "Avion", "Espace", "Intelligence", "Bitcoin",
  "Énergie", "Vaccin", "Satellite", "Blockchain", "Climat",
  "Cryptocurrency", "Pandémie", "Biotechnologie", "Cloud", "Nanotechnologie",
  "Robotique", "Globalisation", "Virtualité", "Quantum", "Automatisation",
  "Cyborg", "Data", "Economie", "Sécurité", "Antivirus",
  "Biodiversité", "Migration", "Urbanisation", "Agriculture", "Transhumanisme",
  "Innovation", "Cryptographie", "Biomédecine", "Conservation", "Durabilité",
  "Veganisme", "Réseaux", "Smartphone", "Streaming", "Photovoltaïque",
  "Neutralité", "Progrès", "Épidémie", "Technologie", "Désinformation",
  "Urbanisme", "Hydrogène", "Algorithme", "Socialisme", "Capacité",
  "Digitalisation", "Influenceur", "Média", "Startup", "Bourse",
  "Télétravail", "Régulation", "Éthique", "Éducation", "Informatique",
  "Réchauffement", "Biodégradable", "Quotient", "Pollution", "Smart",
  "Tourisme", "Logistique", "Développement", "Privatisation", "Patrimoine",
  "Conflit", "Criminalité", "Piratage", "Hacktivisme", "Libéralisme",
  "Humanitaire", "Identité", "Marketing", "Consommation", "Santé",
  "Compétitivité", "Diversité", "Écologie", "Cryptomonnaie", "Viralité",
  "Ressource", "Collectif", "Intégration", "Plastique", "Carbone",
  "Résilience", "Sécheresse", "Incubateur", "Intelligence", "Assurance",
  "Patriotisme", "Souveraineté", "Investissement", "Subvention", "Convergence",
  "Technocratie", "Numérique", "Syndicat", "Gentrification", "Innovation",
  "Justice", "Liberté", "Cryptage", "Mortalité", "Natalité",
  "Censure", "Refugies", "Démographie", "Résistance", "Indépendance",
  "Culture", "Technologie", "Humanisme", "Environnement", "Droit",
  "Diplomatie", "Finance", "Stratégie", "Productivité", "Protection",
  "Propriété", "Réparation", "Civilisation", "Renaissance", "Média",
  "Communication", "Connectivité", "Espionnage", "Privatisation", "Innovation",
  "Revenu", "Mobilité", "Matériaux", "Énergie", "Créativité",
  "Diplomatie", "Trafic", "Guerre", "Pétrole", "Solidarité"
]),

   JustOneCategoryScreen(categoryName: 'Sportif', mots: [
  "Football", "Basketball", "Tennis", "Natation", "Ski",
  "Marathon", "Cyclisme", "Gymnastique", "Golf", "Rugby",
  "Cricket", "Boxe", "Formule", "Surf", "Escrime",
  "Judo", "Karate", "Athlétisme", "Handball", "Volley",
  "Baseball", "Hockey", "Skateboard", "Snowboard", "Escalade",
  "Lutte", "Taekwondo", "Aviron", "Equitation", "Polo",
  "Triathlon", "Pentathlon", "Biathlon", "Squash", "Badminton",
  "Curling", "Snooker", "Crossfit", "Zumba", "Yoga",
  "Pilates", "Spinning", "Rowing", "Canoe", "Kayak",
  "Rafting", "Plongée", "Voile", "BMX", "Parkour",
  "Kickboxing", "Muaythai", "Sumo", "Sambo", "Fencing",
  "Archery", "Darts", "Bowling", "Pétanque", "Boccia",
  "Bobsleigh", "Luge", "Skeleton", "Toboggan", "Roller",
  "Freestyle", "Sprint", "Saut", "Lancer", "Discus",
  "Javelot", "Marche", "Slalom", "Relais", "Relay",
  "Sprint", "Tackle", "Dribble", "Volley", "Smash",
  "Service", "Pass", "Dunk", "Alley-oop", "Spike",
  "Set", "Ace", "Fault", "Rebound", "Save",
  "Goal", "Header", "Penalty", "Offside", "Scrum",
  "Lineout", "Maul", "Ruck", "Kickoff", "Touchdown",
  "Fieldgoal", "Punt", "Blitz", "Sack", "Interception",
  "Homerun", "Steal", "Strikeout", "Doubleplay", "Tripleplay",
  "Pinch", "Bunt", "Grounder", "Flyball", "LineDrive",
  "Paddle", "Serve", "Dive", "Butterfly", "Freestyle",
  "Backstroke", "Breaststroke", "Medley", "Draft", "Pole",
  "Jump", "Vault", "Pommel", "Rings", "Floor",
  "Parallel", "Horizontal", "Rope", "Beam", "Pommelhorse",
  "Horse", "Trap", "Skeet", "Pistol", "Rifle",
  "Biathlon", "Nordic", "Downhill", "Slalom", "Mogul",
  "Halfpipe", "Bigair", "SuperG", "Boardercross", "Cross",
  "Hurdles", "Relay", "Heptathlon", "Decathlon", "Throw",
  "Shotput", "Javelin", "Discus", "Hammer", "Polevault"
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
         centerTitle: true,
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

class HomeScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Centre horizontalement
        children: [
          Text(
            'Jeu d\'équipe !',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Règles du jeu :\n\n'
            '1. Un joueur doit deviner un mot sans le voir.\n'
            '2. Les autres joueurs écrivent un indice chacun (sur un bout de papier par exemple).\n'
            '3. Ils se montrent ensuite leur mot-indice. Si des indices sont identiques, l\'indice sera éliminé et le devineur ne le verra pas.\n'
            '4. Si le devineur trouve le mot, l\'équipe gagne un point. S\'il passe, l\'équipe perd une carte. S\'il se trompe, l\'équipe perd deux cartes.\n'
            '5. L\'objectif est de conserver le maximum de cartes, jusqu\'à un maximum de 13.\n'
            '6. Utilisez les différentes catégories pour des thèmes variés !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.5, // Ajoute de l'espace entre les lignes
            ),
          ),
        ],
      ),
    ),
  );
}
}

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
    motsRestants = List.from(widget.mots); // Crée une copie de la liste des mots
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
    stopGame();  // Arrête la partie en cours
    setState(() {
      message = '';
      gameStarted = false; // Revenir à l'état initial
      motsRestants = List.from(widget.mots); // Réinitialiser les mots
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
                Navigator.of(context).pop(); // Ferme le dialogue
                startGame(); // Redémarre une nouvelle partie
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
                  Text(message.isEmpty
                      ? '${widget.categoryName} !'
                      : message),
                  SizedBox(height: 20),
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
