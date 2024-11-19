import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/merch.dart';

class MerchTile extends StatelessWidget {
  final Merch merch;
  final void Function()? onTap;

  const MerchTile({
    Key? key,
    required this.merch,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200, // Adjust the height as needed
        padding: const EdgeInsets.only(
          top: 15,
          left: 12,
          right: 12,
          bottom: 10,
        ), // Add padding to the bottom
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              merch.imagePath,
              height: 140,
            ),

            // text
            Text(
              merch.name,
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // price + rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price
                  Text(
                    '\$${merch.price}',
                    style: GoogleFonts.dmSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),

                  // rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        merch.rating.toString(),
                        style: GoogleFonts.dmSans(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
