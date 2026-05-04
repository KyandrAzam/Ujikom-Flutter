import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  // 📦 BOX UTAMA
  Widget infoBox(String title, IconData icon, Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // HEADER
          Row(
            children: [
              Icon(icon, color: Colors.deepPurple, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // CONTENT
          child,
        ],
      ),
    );
  }

  // 📊 STAT BAR
  Widget statBar(String label, int value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label : $value"),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value / 150,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),

      appBar: AppBar(
        title: Text(pokemon.name),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🖼️ IMAGE CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset(
                    pokemon.image,
                    height: 180,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pokemon.type,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 📦 ROLE
            infoBox("Role", Icons.sports_esports,
                Text(pokemon.role)),

            // 📦 ABILITY
            infoBox("Ability", Icons.flash_on,
                Text(pokemon.ability)),

            // 📦 WEAKNESS
            infoBox("Weakness", Icons.warning_amber,
                Text(pokemon.weakness)),

            // 📦 EVOLUTION
            infoBox("Evolution", Icons.trending_up,
                Text(pokemon.evolution)),

            // 📦 PARTNER
            infoBox("Best Partner (Co-Lab)", Icons.group,
                Text(pokemon.partner)),

            // 📦 STRATEGY
            infoBox("Recommended Strategy", Icons.lightbulb,
                Text(pokemon.partnerRecommendation)),

            // 📊 STATS (SEMUA DI 1 BOX)
            infoBox(
              "Stats",
              Icons.bar_chart,
              Column(
                children: [
                  statBar("HP", pokemon.hp),
                  statBar("Attack", pokemon.attack),
                  statBar("Defense", pokemon.defense),
                  statBar("Sp. Atk", pokemon.spAttack),
                  statBar("Sp. Def", pokemon.spDefense),
                  statBar("Speed", pokemon.speed),
                ],
              ),
            ),

            // 🧠 DESCRIPTION
            infoBox(
              "Description",
              Icons.menu_book,
              Text(pokemon.description),
            ),
          ],
        ),
      ),
    );
  }
}