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
JustOneCategoryScreen(
  categoryName: 'Célébrité', 
  mots: [
    "Brad", "Beyoncé", "Einstein", "Marilyn", "Chaplin",
    "Elvis", "Gaga", "Leonardo", "Michael", "Tom",
    "Madonna", "Disney", "Adele", "Rihanna", 
    "Shakira", "Drake", "Mick", "Prince", "Eminem",
    "Cher", "Sting", "Zayn", "Usher", "Shakira",
    "Whitney", "Pink", "Sia", "Kanye", 
    "Bono", "JLo", "Cardi", "Pitbull",
    "Zendaya", "Scarlett", "Bieber", "Selena",  
    "Hulk", "Spock", "Bond",
    "Mickey", "Thor", "Quincy", 
    "Gandhi", "Tesla", "Picasso", "Freud", "Jobs",
    "Gates", "Branson", "Zuckerberg", "Musk", "Snoop", "Bono", "Luther",
    "Newton", "Platon", "Aristote", "Bouddha", 
    "Georges", "Abraham", "Churchill", "Napoléon", "César",
    "Cléopâtre", "Toutânkhamon", "Shakespeare", "Mozart", "Beethoven",
    "Chopin", "Dali", "Van", "Rembrandt", "Warhol",
    "Hitchcock", "Spielberg", "Tarantino", "Nolan", 
    "Rowling","Bowie", "Harrison", "Jagger", "Alicia", "Kurt", "Kylie", "Gwen", "Jared", "Rita", "Kesha", "Megan", "Halsey", "Kendrick", "Ariana", "Tina", "Janet", "Chris", "Travis", "Nelly", "Pharrell", "Ed", "Shawn", "Miley", "Khaled", "Lil", "Sabrina", "Nicki", "Charlie", "Harry", "Taylor", "Selena", "Justin", "Katy", "Blake", "Marshmello", "Paul", "Lenny", "Tracy", "Hugh", "Jim", "Jack", "Nina", "Shania", "Dolly", "Loretta", "Gareth", "Tim", "Alan", "Dwayne", "Ryan", "Matt", "Ben", "Will", "Jude", "Jeremy", "Jeff", "Oscar", "Mark", "Samuel", "Eva", "Penélope", "Cate", "Lazare", "Emma", "Margot", "Rachel", "Saoirse", "Judas", "Zoe", "Jessica", "Anne", "Meryl", "Nicole", "Julianne", "Gal", "Saül", "Samson", "Rébecca", "Jean-Baptiste", "Daniel ", "Kristen", "Élisée", "Jérémie", "Salomon", "David", "Joseph", "Isaac", "Noé", "Adam", "Zacharie", "Pilate", "Simon", "Marie", "Veronique", "Jonas", "Jacob", "Moïse", "Elie", "Halle", "Tiffany", "Issa", "Tracee"
  ]
)
,

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
  "Accra", "Kumasi", "Abidjan", "Yamoussoukro", "Monrovia","Montagne", "Désert", "Forêt", "Océan", "Volcan", "Île", "Rivière", "Lac", "Fjord", "Plage",
"Canyon", "Colline", "Vallée", "Delta", "Toundra", "Savane", "Steppe", "Glacier", "Archipel",
"Atoll", "Baie", "Côte", "Cap", "Marais", "Lagune", "Péninsule", "Continent", "Récif",
"Plateau", "Dune", "Prairie", "Région", "Estuaire", "Tsunami", "Cyclone", "Tornade", "Tremblement",
"Équateur", "Tropique", "Méridien", "Hemisphere", "Oasis", "Volcan", "Crête", "Isthme",
"Plissement", "Gorge", "Faille", "Sierra"
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
 "Djokovic", "Nadal", "Federer", "Alcaraz", "Medvedev",
  "Tsitsipas", "Zverev", "Rublev", "Murray", "Rune",
  "Berrettini", "Thiem", "Auger", "Kyrgios", "Sinner",
  "Open", "Roland", "Wimbledon", "US", "Davis",
  "Chelem", "Ace", "Service", "Revers", "Coup",
  "Tie-break", "Lob", "Passing", "Smash", "Break",
  "Match", "Faute", "Slice", "Let", "Avantage",
  "Retour", "Échange", "Set", "Raquette", "Surface",
  "Terre", "Gazon", "Éraflure", "Filet", "Balle",

  // Basket féminin (LFB, LF2)
  "Bourges", "ASVEL", "Villeneuve", "Landes", "Toulouse",
  "Mondeville", "Angers", "Nantes", "Roche", "Charleville",
  "LF2", "Playoffs", "Finale", "Trois", "Double",
  "Dunk", "Rebond",  "Tir", "Foul",

  // Football masculin (2018)
  "Mbappé", "Griezmann", "Pogba", "Kanté", "Varane",
  "Lloris", "Giroud", "Deschamps", "Modric", "Mandzukic",
  "Kane", "Hazard", "Courtois", "Ronaldo", "Messi",
  "France", "Croatie", "Belgique", "Angleterre", "Coupe",
  "Finale", "But", "Pénalty", "Hors-jeu", "Carton",
  "Coup-franc", "Corner", "Tacle", "Contre-attaque", "Arbitre"

    // Rugby
  "Essai", "Mêlée", "Transformation", "Plaquage", "Drop",
  "Touche", "Troisième", "Ligne", "Carton", "Prolongation",
  
  // Football américain (FootUS)
  "Touchdown", "Quarterback", "Fumble", "Fieldgoal", "Interception",
  "Tackle", "Endzone", "Linebacker", "Superbowl", "Snap",

  // Basket masculin
  "NBA", "Finales", "LeBron", "Curry", "Durant",
  "All-Star", "Buzzer","Dunk",
  
  // Baseball
  "HomeRun", "Strike", "Pitcher", "Catcher", "Base",
  "Outfield", "Inning", "Hit", "Run",

  // Volley-ball
  "Service", "Smash", "Block", "Ace", "Récupération",
  "Contre", "Passeur", "Rotation", "Point", "Set",

  // Handball
  "Buteur", "Gardien", "Jet", "Pénalty", 
  "Ailier", "Pivot", "Cadré",

  // Judo
  "Ippon", "Tatami", "Ceinture",
  "Prise", "Projection", "Ne-waza", "Shido", "Dojo",

  // Cyclisme (Vélo)
  "Tour", "Sprint", "Contre-la-montre", "Peloton", "Échappée",
  "Maillot", "Col", "Grimpeur", "Vélo", "Bidon",

  // MMA
  "Octogone", "Soumission", "Takedown", 
   "Grappling", "Jab", "Coup", "Poing",

  // Boxe
  "Ring", "KO", "Uppercut", "Direct", "Crochet",
  "Poids", "Gant", "Rond", "Garde",

  // Athlétisme (Athlé)
  "Sprint", "Relais", "Marathon", "Lancer", "Hauteur",
  "Longueur", "Disque", "Javelot", "Perche", "Départ"
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
