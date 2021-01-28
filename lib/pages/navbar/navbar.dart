import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/providers/utility_provider.dart';
import 'package:portfolio_app/utilities/strings.dart';
import 'package:provider/provider.dart';

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatefulWidget {
  @override
  _DesktopNavbarState createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32),
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Flexible(child: websiteIcon()),
              Flexible(child: navBarItems(scrollController)),
            ])));
  }
}

class MobileNavbar extends StatefulWidget {
  @override
  _MobileNavbarState createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();

    return Container(
        child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: websiteIcon()),
        SizedBox(
          height: 20,
        ),
        navBarItems(scrollController)
      ],
    ));
  }
}

Widget websiteIcon() {
  return GestureDetector(
    onTap: () {},
    child: Row(
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
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget navBarItems(ScrollController scrollController) {
  return Row(
    // mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      navBarOptions(kAbout, 1, () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent + 120,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      }),
      navBarOptions(kServices, 2, () {
        scrollController.animateTo(
          0.30 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      navBarOptions(kPortfolio, 3, () {
        scrollController.animateTo(
          0.60 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      navBarOptions(kContact, 4, () {
        scrollController.animateTo(
          1 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
    ],
  );
}

Widget navBarOptions(String title, int position, Function function) {
  return InkWell(
    onTap: function,
    hoverColor: Colors.grey[200],
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
