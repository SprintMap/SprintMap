import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBuilder extends StatelessWidget {
  const InfoBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Created By ',
              style: const TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'FlexZ\n',
                  style: GoogleFonts.acme(
                    color: const Color.fromARGB(255, 112, 119, 249),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '@CodeWithFlexZ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
