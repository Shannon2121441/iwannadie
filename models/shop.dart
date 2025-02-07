import 'package:flutter/material.dart';
import 'merch.dart';

class Shop extends ChangeNotifier {
  //merch menu
  final List<Merch> _merchMenu = [
    Merch(
      name: "Venti",
      artist: "Kamiyo",
      desc:
          "He is a free-spirited, wine-loving bard of Mondstadt, belying his identity as Barbatos, the Anemo Archon.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/venti.png",
      rating: 5.0,
    ),
    Merch(
      name: "Zhongli",
      artist: "Kamiyo",
      desc:
          "A consultant of the Wangsheng Funeral Parlor, he is later revealed to be the Geo Archon, Morax, who has decided to experience the world from the perspective of a mortal.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/zl.png",
      rating: 4.8,
    ),
    Merch(
      name: "Ei",
      artist: "Kamiyo",
      desc:
          "Raiden Ei is the God of Eternity and the current Electro Archon among The Seven who presides over Inazuma. She abandoned her body and transferred her consciousness into the Musou Isshin, which is now stored in the Shogun puppet.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/ei.png",
      rating: 4.5,
    ),
    Merch(
      name: "Nahida",
      artist: "Kamiyo",
      desc:
          "As Lesser Lord Kusanali, she strives to have a stronger presence in Sumeru now that she has been freed from her extensive confinement in the Sanctuary of Surasthana.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/nahida.png",
      rating: 4.8,
    ),
    Merch(
      name: "Furina",
      artist: "Kamiyo",
      desc:
          "Introduced as the flamboyant and overconfident Hydro Archon, Furina's theatrics are eventually revealed to be a public persona, which she later discards in favor of living a relatively humbler life as an actress and artistic consultant.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/furina.png",
      rating: 5.0,
    ),
    Merch(
      name: "Neuvillette",
      artist: "Kamiyo",
      desc:
          "Neuvillette is the Iudex of Fontaine, and the leader of the Marechaussee Phantom. While Neuvillette upholds the rules of the court with utmost reverence, he is quite aloof when dealing with human emotions and often distances himself from the public eye.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/neuvillette.png",
      rating: 4.5,
    ),
    Merch(
      name: "Kazuha",
      artist: "Kamiyo",
      desc:
          "A wandering samurai of the once-famed Kaedehara Clan with an ability to read the sounds of nature, Kazuha is a temporary crewmember of The Crux. Despite being burdened by the many happenings of his past, Kazuha still maintains an easygoing disposition.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/kazuha.png",
      rating: 4.5,
    ),
    Merch(
      name: "Wriothesley",
      artist: "Kamiyo",
      desc:
          "Having killed his abusive foster parents to save his adoptive siblings, Wriothesley was sentenced and exiled to the Fortress of Meropide in his teenage years. He eventually became its Administrator and has enforced a series of reforms under his rule, serving as a role model for the prisoners.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/wrio.png",
      rating: 4.2,
    ),
    Merch(
      name: "Xiao",
      artist: "Kamiyo",
      desc:
          "He is an adeptus, under the name Alatus, and the sole surviving member of the five foremost Yakshas dispatched by Morax to subdue the demonic spirits that plagued Liyue. He currently resides at Wangshu Inn and mostly restrains himself from large crowds and social interactions.",
      merchtype: "Sticker",
      category: "Games",
      fandom: "Genshin",
      price: 20.00,
      imagePath: "lib/images/xiao.png",
      rating: 4.2,
    ),
    Merch(
      name: "No Face",
      artist: "Atokyojin",
      desc:
          "No-Face is a lonely spirit who begins to follow Chihiro Ogino after having developed an interest in her sincerity.",
      merchtype: "Sticker",
      category: "Anime",
      fandom: "Ghibli",
      price: 20.00,
      imagePath: "lib/images/noface.png",
      rating: 5.0,
    ),
    Merch(
      name: "Soot Sprite",
      artist: "Atokyojin",
      desc:
          "Soot sprites are spirits that appear in the films My Neighbor Totoro and Spirited Away.",
      merchtype: "Sticker",
      category: "Anime",
      fandom: "Ghibli",
      price: 20.00,
      imagePath: "lib/images/soot.png",
      rating: 4.8,
    ),
    Merch(
      name: "Hanako-kun",
      artist: "Atokyojin",
      desc:
          "Hanako-kun is a ghost in the old building of Kamome Academy who grants wishes and governs over the Seven Mysteries as School Mystery Number 7.",
      merchtype: "Sticker",
      category: "Anime",
      fandom: "TBHK",
      price: 20.00,
      imagePath: "lib/images/tbhk.png",
      rating: 4.5,
    ),
    Merch(
      name: "Maomao",
      artist: "Atokyojin",
      desc: "Maomao is the main protagonist of The Apothecary Diaries series.",
      merchtype: "Sticker",
      category: "Anime",
      fandom: "KnH",
      price: 20.00,
      imagePath: "lib/images/maomao.png",
      rating: 4.8,
    ),
    Merch(
      name: "Bocchi",
      artist: "Atokyojin",
      desc:
          "Bocchi the Rock is a Japanese four-panel manga series written and illustrated by Aki Hamaji.",
      merchtype: "Sticker",
      category: "Anime",
      fandom: "Bocchi",
      price: 20.00,
      imagePath: "lib/images/bocchi.png",
      rating: 4.8,
    ),
    Merch(
      name: "Le sserafim",
      artist: "HYBE",
      desc: "Le Sserafim is a South Korean girl group formed by Source Music.",
      merchtype: "Poster",
      category: "Kpop",
      fandom: "LS",
      price: 20.00,
      imagePath: "lib/images/ls1.jpg",
      rating: 4.5,
    ),
    Merch(
      name: "Chaewon",
      artist: "HYBE",
      desc: "This is Chaewon from Le Sserafim.",
      merchtype: "PC",
      category: "Kpop",
      fandom: "LS",
      price: 20.00,
      imagePath: "lib/images/ls2.jpg",
      rating: 4.2,
    ),
    Merch(
      name: "Sakura",
      artist: "HYBE",
      desc: "This is Sakura from Le Sserafim.",
      merchtype: "PC",
      category: "Kpop",
      fandom: "LS",
      price: 20.00,
      imagePath: "lib/images/ls3.jpg",
      rating: 4.2,
    ),
    Merch(
      name: "Yunjin",
      artist: "HYBE",
      desc: "This is Yunjin from Le Sserafim.",
      merchtype: "PC",
      category: "Kpop",
      fandom: "LS",
      price: 20.00,
      imagePath: "lib/images/ls4.jpg",
      rating: 4.2,
    ),
    Merch(
      name: "Kazuha",
      artist: "HYBE",
      desc: "This is Kazuha from Le Sserafim.",
      merchtype: "PC",
      category: "Kpop",
      fandom: "LS",
      price: 20.00,
      imagePath: "lib/images/ls5.jpg",
      rating: 4.2,
    ),
    Merch(
      name: "Eunchae",
      artist: "HYBE",
      desc: "This is Eunchae from Le Sserafim.",
      merchtype: "PC",
      category: "Kpop",
      fandom: "LS",
      price: 20.00,
      imagePath: "lib/images/ls6.jpg",
      rating: 4.2,
    ),
    Merch(
      name: "NewJeans",
      artist: "Kamiyo",
      desc: "NewJeans is a South Korean girl group formed by ADOR.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "NewJeans",
      price: 20.00,
      imagePath: "lib/images/nj1.png",
      rating: 5.0,
    ),
    Merch(
      name: "Minji",
      artist: "Kamiyo",
      desc: "This is Minji from NewJeans.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "NewJeans",
      price: 20.00,
      imagePath: "lib/images/nj2.png",
      rating: 4.5,
    ),
    Merch(
      name: "Hanni",
      artist: "Kamiyo",
      desc: "This is Hanni from NewJeans.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "NewJeans",
      price: 20.00,
      imagePath: "lib/images/nj3.png",
      rating: 4.5,
    ),
    Merch(
      name: "Danielle",
      artist: "Kamiyo",
      desc: "This is Danielle from NewJeans.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "NewJeans",
      price: 20.00,
      imagePath: "lib/images/nj4.png",
      rating: 4.5,
    ),
    Merch(
      name: "Haerin",
      artist: "Kamiyo",
      desc: "This is Haerin from NewJeans.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "NewJeans",
      price: 20.00,
      imagePath: "lib/images/nj5.png",
      rating: 4.5,
    ),
    Merch(
      name: "Hyein",
      artist: "Kamiyo",
      desc: "This is Hyein from NewJeans.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "NewJeans",
      price: 20.00,
      imagePath: "lib/images/nj6.png",
      rating: 4.5,
    ),
    Merch(
      name: "TXT",
      artist: "Kamiyo",
      desc:
          "Tomorrow X Together, commonly known as TXT, is a South Korean boy band formed by Big Hit Entertainment.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "TXT",
      price: 20.00,
      imagePath: "lib/images/txt1.png",
      rating: 4.5,
    ),
    Merch(
      name: "Soobin",
      artist: "Kamiyo",
      desc: "This is Soobin from Tomorrow x Together.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "TXT",
      price: 20.00,
      imagePath: "lib/images/txt2.png",
      rating: 4.5,
    ),
    Merch(
      name: "Yeonjun",
      artist: "Kamiyo",
      desc: "This is Yeonjun from Tomorrow x Together.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "TXT",
      price: 20.00,
      imagePath: "lib/images/txt3.png",
      rating: 4.5,
    ),
    Merch(
      name: "Beomgyu",
      artist: "Kamiyo",
      desc: "This is Beomgyu from Tomorrow x Together.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "TXT",
      price: 20.00,
      imagePath: "lib/images/txt4.png",
      rating: 4.5,
    ),
    Merch(
      name: "Taehyun",
      artist: "Kamiyo",
      desc: "This is Taehyun from Tomorrow x Together.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "TXT",
      price: 20.00,
      imagePath: "lib/images/txt5.png",
      rating: 4.5,
    ),
    Merch(
      name: "Huening Kai",
      artist: "Kamiyo",
      desc: "This is Huening Kai from Tomorrow x Together.",
      merchtype: "Sticker",
      category: "Kpop",
      fandom: "TXT",
      price: 20.00,
      imagePath: "lib/images/txt6.png",
      rating: 4.5,
    ),
  ];

  //customer cart
  final List<Merch> _cart = [];

  //getter methods
  List<Merch> get merchMenu => _merchMenu;
  List<Merch> get cart => _cart;

  //add to cart
  void addToCart(Merch merchItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(merchItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Merch merch) {
    _cart.remove(merch);
    notifyListeners();
  }
}
