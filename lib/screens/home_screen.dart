import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
