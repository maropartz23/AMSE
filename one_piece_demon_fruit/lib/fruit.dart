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
      type: "Paramecia",
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
          "Permet à son utilisateur de créer et de manipuler des fils invisibles afin de les utiliser pour contrôler ses adversaires tels des marionnettes, découper toute chose, des personnes ou des bâtiments et même s'en servir pour voler dans le ciel en accrochant ces fils aux nuages, transformant ainsi son utilisateur en Homme-Fils ",
      image: "assets/ito-ito.webp",
      type: "Paramecia",
      user: "Don Quijote Doflamingo",
      userImage: "assets/dofla.webp"),
  Fruit(
      name: "Mera Mera no Mi",
      description:
          "Permet à son utilisateur de créer, contrôler et de se transformer en feu et flammes à volonté. Ce fruit fut mangé par Portgas D. Ace puis, 2 ans après la mort de ce dernier, par Sabo.",
      image: "assets/mera-mera.jpeg",
      type: "Logia",
      user: "Sabo",
      userImage: "assets/sabo.jpg"),
  Fruit(
      name: "Goro Goro no Mi",
      description:
          "Permet à son utilisateur de se transformer, de produire à volonté ainsi que contrôler l'électricité.",
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
          "Permet à son utilisateur de créer, contrôler et de devenir de la glace.",
      image: "assets/hie-hie.webp",
      type: "Logia",
      user: "Kuzan Aokiji",
      userImage: "assets/aokiji.webp"),
  Fruit(
      name: "Moku Moku no Mi",
      description:
          "L'utilisateur de ce fruit est capable de générer, de manipuler et de devenir de la fumée.",
      image: "assets/moku-moku.webp",
      type: "Logia",
      user: "Smocker",
      userImage: "assets/smoker.jpg"),
  Fruit(
      name: "Suna Suna no Mi",
      description:
          "Permet de produire à volonté, de contrôler et de se transformer en sable, transformant l'utilisateur en Homme-Sable.",
      image: "assets/suna-suna.webp",
      type: "Logia",
      user: "Crocodile",
      userImage: "assets/croco.jpeg"),
  Fruit(
      name: "Yami Yami no Mi",
      description:
          "Permet à son utilisateur de produire, devenir et contrôler les ténèbres, le transformant ainsi en Homme-Ténèbres. ",
      image: "assets/yami-yami.jpeg",
      type: "Logia",
      user: "Marshall D. Teach (Barbe Noire)",
      userImage: "assets/teach.webp"),
  Fruit(
      name: "Magu Magu no Mi",
      description:
          "Permet à son utilisateur de devenir, de générer et de contrôler le magma à volonté, transformant l'utilisateur en Homme-Magma.",
      image: "assets/magu-magu.webp",
      type: "Logia",
      user: "Akainu",
      userImage: "assets/akainu.webp"),
  Fruit(
      name: "Neko Neko no Mi (Model Léopard)",
      description:
          "Permet à son utilisateur de se transformer en léopard ou en un hybride humain-léopard.",
      image: "assets/neko.webp",
      type: "Zoan",
      user: "Rob Lucci",
      userImage: "assets/rob.webp"),
  Fruit(
      name: "Tori Tori no Mi (Model Faucon)",
      description:
          "Permet à son utilisateur de se transformer en un faucon complet ou en un être hybride faucon-humain. Ce Fruit du Démon est un des rares 5 Fruits du Démon qui permettent à leur utilisateur de voler.",
      image: "assets/tori-tori.png",
      type: "Zoan",
      user: "Pell",
      userImage: "assets/pell.webp"),
  Fruit(
      name: "Doru Doru no Mi",
      description:
          "Permet à son utilisateur de créer et de contrôler de la cire à volonté. L’utilisateur devient ainsi un Homme-Bougie",
      image: "assets/doru-doru.jpg",
      type: "Paramecia",
      user: "Mr. 3",
      userImage: "assets/mr3.webp"),
  Fruit(
      name: "Ope Ope no Mi",
      description:
          "Permet à son utilisateur de créer une sphère d'aura bleue claire translucide, où l'utilisateur peut contrôler comme bon lui semble le placement et l'orientation des objets et des êtres vivants à l'intérieur. L'utilisateur peut aussi donner la vie éternelle en échange de sa propre vie.",
      image: "assets/ope-ope.webp",
      type: "Logia",
      user: "Trafalgard D. Water Law",
      userImage: "assets/law.webp"),
  Fruit(
      name: "Ryu Ryu no Mi (Model Pteranodon)",
      description:
          "Ce Fruit permet de se transformer en un être hybride ptéranodon ou en ptéranodon complet.",
      image: "assets/ryu-ryu.webp",
      type: "Zoan",
      user: "King",
      userImage: "assets/king.webp"),
  Fruit(
      name: "Suna Suna no Mi",
      description:
          "Permet de produire à volonté, de contrôler et de se transformer en sable, transformant l'utilisateur en Homme-Sable.",
      image: "assets/suna-suna.webp",
      type: "Logia",
      user: "Crocodile",
      userImage: "assets/croco.jpeg"),
  Fruit(
      name: "Suna Suna no Mi",
      description:
          "Permet de produire à volonté, de contrôler et de se transformer en sable, transformant l'utilisateur en Homme-Sable.",
      image: "assets/suna-suna.webp",
      type: "Logia",
      user: "Crocodile",
      userImage: "assets/croco.jpeg"),
  Fruit(
      name: "Suna Suna no Mi",
      description:
          "Permet de produire à volonté, de contrôler et de se transformer en sable, transformant l'utilisateur en Homme-Sable.",
      image: "assets/suna-suna.webp",
      type: "Logia",
      user: "Crocodile",
      userImage: "assets/croco.jpeg"),
];
