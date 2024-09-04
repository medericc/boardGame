import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'just_one_category_screen.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

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

   JustOneCategoryScreen(categoryName: 'Sport', mots: [
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
]), ];

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
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 163, 230),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
