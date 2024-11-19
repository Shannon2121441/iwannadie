import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/components/merch_tile.dart';
import 'package:kms/models/shop.dart';
import 'package:kms/pages/product_screen.dart';
import 'package:kms/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:kms/pages/navbar.dart';
import 'package:kms/pages/anime_page.dart';
import 'package:kms/pages/gaming_page.dart';
import 'package:kms/pages/kpop_page.dart';

import 'package:kms/pages/auth_service.dart'; // Import AuthService

import 'merch_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to merch item details page
  void navigateToMerchDetails(int index) {
    //get the shop and its the menu
    final shop = context.read<Shop>();
    final merchMenu = shop.merchMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MerchDetailsPage(
          merch: merchMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and its the menu
    final shop = context.read<Shop>();
    final merchMenu = shop.merchMenu;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 229, 237),
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: secondaryColor,
        foregroundColor: Color.fromARGB(249, 255, 249, 249),
        elevation: 0,
        title: Text(
          "Figuras d'Arte",
          style: GoogleFonts.dmSans(fontSize: 20, color: Colors.white),
        ),
        actions: [
          //cart button
          IconButton(
            onPressed: () async {
              final isLoggedIn = await AuthService.isLoggedIn();
              if (isLoggedIn) {
                Navigator.pushNamed(context, '/cartpage');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please log in to view your cart.'),
                  ),
                );
                Navigator.pushNamed(context, '/login');
              }
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //promo message
                    Text(
                      'Buy 3 for 50!',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Only until April 30!',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '*selected products only*',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                //image
                Image.asset(
                  'lib/images/sale.png',
                  height: 90,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[800],
                  ),
                  hintText: "Search here...",
                ),
              ),
            ),
          ),
          //category
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, top: 25.0, right: 25.0, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.1,
                  children: [
                    //anime
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimePage(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 117, 199, 237),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.local_movies),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Anime",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //gaming
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 129, 225, 171),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.videogame_asset),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Gaming",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //kpop
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KpopPage(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 230, 147, 241),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.music_note),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Kpop",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //menu list
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Merch",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => MerchTile(
                merch: merchMenu[index],
                onTap: () => navigateToMerchDetails(index),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
