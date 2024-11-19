import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/components/button.dart';
import 'package:kms/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //icon
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/triquetra.png'),
            ),

            //title
            Center(
              child: Text(
                "Figuras d'Arte",
                style: GoogleFonts.dmSans(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),

            //subtitle
            Center(
              child: Text(
                "The premier destination for enthusiasts of anime, gaming, and K-pop.",
                style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),

            //get started button
            MyButton(
              text: "Get Started",
              onTap: () {
                //go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
