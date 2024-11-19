import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/components/button.dart';
import 'package:kms/models/merch.dart';
import 'package:kms/models/shop.dart';
import 'package:kms/pages/login_screen.dart'; // Import the login page
import 'package:kms/pages/auth_service.dart'; // Import the AuthService for checking login status
import 'package:kms/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  // Remove from cart
  void removeFromCart(Merch merch, BuildContext context) {
    // Get access to shop
    final shop = context.read<Shop>();

    // Remove from cart
    shop.removeFromCart(merch);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) {
        // Group merchandise items by name and sum up quantities
        final Map<String, int> groupedMerch = {};
        value.cart.forEach((merch) {
          groupedMerch.update(merch.name, (value) => value + 1,
              ifAbsent: () => 1);
        });

        // Calculate total price
        double totalPrice = 0;
        value.cart.forEach((merch) {
          totalPrice +=
              merch.price; // Use merch.price directly as it's already a double
        });

        return Scaffold(
          backgroundColor: Color.fromARGB(255, 231, 229, 237),
          appBar: AppBar(
            foregroundColor: Color.fromARGB(249, 255, 249, 249),
            elevation: 0,
            title: Text(
              "My Cart",
              style: GoogleFonts.dmSans(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: secondaryColor,
          ),
          body: Column(
            children: [
              // Customer cart
              Expanded(
                child: ListView.builder(
                  itemCount: groupedMerch.length,
                  itemBuilder: (context, index) {
                    // Get merch name and quantity
                    final String merchName = groupedMerch.keys.elementAt(index);
                    final int quantity = groupedMerch.values.elementAt(index);

                    // Find the first merch with the name
                    final Merch merch =
                        value.cart.firstWhere((item) => item.name == merchName);

                    // Get merch price and calculate total price for the item
                    final double itemTotalPrice = merch.price * quantity;

                    // Return list tile
                    return Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          merch
                              .imagePath, // Assuming imagePath points to the image URL
                          width: 40, // Adjust the size of the image as needed
                          height: 40,
                        ),
                        title: Text(
                          '$merchName x$quantity', // Display the quantity
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '\$${itemTotalPrice.toStringAsFixed(2)}', // Display the total price for the item
                          style: GoogleFonts.dmSans(
                            color: Colors.grey[200],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[300],
                          ),
                          onPressed: () => removeFromCart(merch, context),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Total price
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Pay button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                  text: "Pay Now",
                  onTap: () async {
                    // Check if the user is logged in
                    final isLoggedIn = await AuthService.isLoggedIn();

                    if (!isLoggedIn) {
                      // If not logged in, display a notification and redirect to the login page
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please log in to proceed.'),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      // If logged in, proceed with payment
                      // Your payment logic here
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
