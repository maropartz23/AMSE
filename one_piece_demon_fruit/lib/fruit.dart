class Fruit {
  final String name;
  final String description;
  final String image;
  final String type; // Logia, Zoan, Paramecia

  Fruit({
    required this.name,
    required this.description,
    required this.image,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'type': type,
    };
  }

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      type: json['type'],
    );
  }
}

List<Fruit> allFruits = [
  Fruit(
    name: "Gomu Gomu no Mi",
    description: "Offre un corps en caoutchouc.",
    image: "assets/gomu_gomu_no_mi.jpg",
    type: "Paramecia",
  ),
  Fruit(
    name: "Mera Mera no Mi",
    description: "Permet de contrôler le feu.",
    image: "assets/mera_mera_no_mi.jpg",
    type: "Logia",
  ),
  Fruit(
    name: "Ushi Ushi no Mi (Model: Bison)",
    description: "Permet de se transformer en bison.",
    image: "assets/ushi_ushi_no_mi.jpg",
    type: "Zoan",
  ),
];
