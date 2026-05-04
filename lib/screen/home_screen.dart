import 'package:flutter/material.dart';
import 'package:ujikom_1/data/data_pokemon.dart';
import 'package:ujikom_1/models/pokemon.dart';
import 'detail_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pokemon> filtered = pokemonList;

  void search(String query) {
    setState(() {
      filtered = pokemonList
          .where((p) =>
              p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Color getColor(String type) {
    if (type.contains("Fire")) return Colors.red.shade200;
    if (type.contains("Water")) return Colors.blue.shade200;
    if (type.contains("Grass")) return Colors.green.shade200;
    if (type.contains("Electric")) return Colors.amber.shade200;
    if (type.contains("Ghost")) return Colors.purple.shade200;
    return Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),

      // 🔥 POKÉMON HEADER STYLE
      appBar: AppBar(
        title: const Text("Pokédex"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFE53935), // Pokémon Red
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [

          // 🌟 HEADER HERO
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFE53935),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: const [
                Icon(
                  Icons.catching_pokemon,
                  size: 70,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Text(
                  "Silph Co. Pokédex ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Find your favorite Pokémon",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search Pokémon...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 📦 GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final p = filtered[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(pokemon: p),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: getColor(p.type),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // 🖼️ IMAGE ROUNDED (POKÉMON STYLE)
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              p.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          p.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(p.type),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}