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
          "Confère l’élasticité au corps, le rendant insensible aux attaques physiques et électriques. Utilisé en combat pour augmenter la portée et la vitesse des attaques.\n\nSPOILER ALERT\n\nn'est pas vraiment un paramecia mais est un fruit du type Zoan mythique. Il est le fruit du dieu de la liberté, Nika, conferrant à son utilisateur le pouvoir d'agir sur toutes choses de la manière dont il le souhaite.",
      image: "assets/gomu-gomu-no-mi.jpg",
      type: "Paramecia",
      user: "Monkee D. luffy",
      userImage: "assets/luffy.jpg"),
  Fruit(
      name: "Tori Tori no Mi",
      description:
          "Permet à son utilisateur de se transformer en phénix. Il peut se régénérer et guérir les blessures des autres.",
      image: "assets/tori-tori-no-mi.jpg",
      type: "Zoan",
      user: "Marco",
      userImage: "assets/marco.jpg"),
  Fruit(
      name: "Uo Uo no Mi (Model: Dragon Azur)",
      description: "Permet de se transformer en dragon azur.",
      image: "assets/Uo-Uo.jpg",
      type: "Zoan",
      user: "Kaido",
      userImage: "assets/kaido.jpg"),
  Fruit(
      name: "Hito Hito no Mi  (Model: Bouddha)",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/hito-hito-no-mi.jpeg",
      type: "Zoan",
      user: "Sengoku",
      userImage: "assets/sengoku.jpeg"),
  Fruit(
      name: "Bara Bara no Mi",
      description:
          "Permet de séparer son corps en plusieurs parties pouvant léviter, sauf les pieds. Insensible aux armes tranchantes.",
      image: "assets/bara-bara.jpeg",
      type: "Paramecia",
      user: "Baggy le Clown",
      userImage: "assets/baggy.jpeg"),
  Fruit(
      name: "Sube Sube no Mi",
      description:
          "Rend la peau ultra-glissante et plus belle, déviant les objets touchant le corps.",
      image: "assets/sube-sube.jpeg",
      type: "Paramecia",
      user: "Alvida",
      userImage: "assets/alvida.jpg"),
  Fruit(
      name: "Bomu Bomu no Mi",
      description:
          "Permet de faire exploser n’importe quelle partie du corps, rendant l’utilisateur insensible aux explosions.",
      image: "assets/boumo-boumo.jpg",
      type: "Zoan",
      user: "Gem",
      userImage: "assets/gem.jpeg"),
  Fruit(
      name: "Hana Hana no Mi",
      description:
          "Permet de faire pousser des parties du corps partout, même sur une autre personne.",
      image: "assets/hana-hana.jpg",
      type: "Paramecia",
      user: "Nico Robin",
      userImage: "assets/robin.jpg"),
  Fruit(
      name: "Mane Mane no Mi",
      description: "Permet de modifier son apparence en touchant son visage.",
      image: "assets/mane-mane.webp",
      type: "Paramecia",
      user: "Bentham",
      userImage: "assets/bonclay.webp"),
  Fruit(
      name: "Bane Bane no Mi",
      description: "Permet de transformer des parties du corps en ressorts.",
      image: "assets/bane-bane.png",
      type: "Paramecia",
      user: "Bellamy",
      userImage: "assets/bellamy.webp"),
  Fruit(
      name: "Ito Ito no Mi",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/ito-ito.webp",
      type: "Paramecia",
      user: "Don Quijote Doflamingo",
      userImage: "assets/dofla.webp"),
  Fruit(
      name: "Mera Mera no Mi",
      description:
          "permet à son utilisateur de créer, contrôler et de se transformer en feu et flammes à volonté. Ce fruit fut mangé par Portgas D. Ace puis, 2 ans après la mort de ce dernier, par Sabo.",
      image: "assets/mera-mera.jpeg",
      type: "Logia",
      user: "Sabo",
      userImage: "assets/sabo.jpg"),
  Fruit(
      name: "Goro Goro no Mi",
      description:
          "permet à son utilisateur de se transformer, de produire à volonté ainsi que contrôler l'électricité",
      image: "assets/goro-goro.webp",
      type: "Logia",
      user: "Ener",
      userImage: "assets/ener.webp"),
  Fruit(
      name: "Pika Pika no Mi",
      description:
          "Permet de se transformer en un immense Daibutsu(Bouddha), augmentant considérablement la force physique et générant des ondes de choc.",
      image: "assets/pika-pika.jpg",
      type: "Logia",
      user: "Borsalino Kizaru",
      userImage: "assets/kizaru.webp"),
  Fruit(
      name: "Hie Hie no Mi",
      description:
          "permet à son utilisateur de créer, contrôler et de devenir de la glace",
      image: "assets/hie-hie.webp",
      type: "Logia",
      user: "Kuzan Aokiji",
      userImage: "assets/aokiji.webp"),
  Fruit(
      name: "Moku Moku no Mi",
      description:
          "L'utilisateur de ce fruit est capable de générer, de manipuler et de devenir de la fumée",
      image: "assets/moku-moku.webp",
      type: "Logia",
      user: "Smocker",
      userImage: "assets/smoker.jpg"),
];
