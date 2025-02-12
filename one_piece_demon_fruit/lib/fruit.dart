class Fruit {
  final String name;
  final String description;
  final String image;
  final String type; // Logia, Zoan, Paramecia
  final String user;
  final String userImage;

  Fruit({
    required this.name,
    required this.description,
    required this.image,
    required this.type,
    required this.user,
    required this.userImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'type': type,
      'user': user,
      '': userImage
    };
  }

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        type: json['type'],
        user: json['user'],
        userImage: json['userImage']);
  }
}

List<Fruit> allFruits = [
  Fruit(
      name: "Gomu Gomu no Mi",
      description:
          "Confère l’élasticité au corps, le rendant insensible aux attaques physiques et électriques. Utilisé en combat pour augmenter la portée et la vitesse des attaques.\n\nSPOILER ALERT\n\nn'est pas vraiment un paramecia mais est un fruit du type Zoan mythique. Il est le fruit du dieu de la liberté, Nika, conférrant à son utilisateur le pouvoir d'agir sur toutes choses de la manière dont il le souhaite.",
      image: "assets/gomu_gomu_no_mi.jpg",
      type: "Paramecia",
      user: "Luffy D luffy",
      userImage: "assets/luffy"),
  Fruit(
      name: "Tori Tori no Mi",
      description:
          "Permet à son utilisateur de se transformer en phénix. Il peut se régénérer et guérir les blessures des autres.",
      image: "assets/tori-tori_no_mi.jpg",
      type: "Zoan",
      user: "Marco",
      userImage: "assets/marco.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bison)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ushi_ushi_no_mi.jpg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpg"),
];
