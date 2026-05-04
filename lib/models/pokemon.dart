class Pokemon {
  final String name;
  final String image;
  final String type;
  final String description;
  final String role;
  final String ability;
  final String weakness;
  final String evolution;

  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  final String partner;
  final String partnerRecommendation;

  Pokemon({
    required this.name,
    required this.image,
    required this.type,
    required this.description,
    required this.role,
    required this.ability,
    required this.weakness,
    required this.evolution,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
    required this.partner,
    required this.partnerRecommendation,
  });
}