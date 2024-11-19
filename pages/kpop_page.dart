import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/components/merch_tile.dart';
import 'package:kms/models/shop.dart';
import 'package:kms/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:kms/pages/merch_details_page.dart';

class KpopPage extends StatelessWidget {
  const KpopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final kpopMerch =
        shop.merchMenu.where((merch) => merch.category == "Kpop").toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        foregroundColor: Color.fromARGB(249, 255, 249, 249),
        elevation: 0,
        title: Text("Kpop",
            style: GoogleFonts.dmSans(fontSize: 20, color: Colors.white)),
        actions: [
          //cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the number of columns as needed
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75, // You can adjust the aspect ratio as needed
        ),
        itemCount: kpopMerch.length,
        itemBuilder: (context, index) {
          return MerchTile(
            merch: kpopMerch[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MerchDetailsPage(
                    merch: kpopMerch[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
