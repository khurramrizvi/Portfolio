import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/utilities/strings.dart';

//This widget will be show as Splash Screen
Widget websiteIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border(
                left: BorderSide(width: 2),
                right: BorderSide(width: 2),
                bottom: BorderSide(width: 2),
                top: BorderSide(width: 2)),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            kIconFirstLetter,
            // style: TextStyle(
            //     fontSize: 20,
            //     color: Colors.redAccent,
            //     fontWeight: FontWeight.bold),
            style: GoogleFonts.poppins(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Text(
        kIconRemainingLetters,
        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
