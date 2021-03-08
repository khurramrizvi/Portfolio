import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/providers/theme_provider.dart';
import 'package:portfolio_app/providers/utility_provider.dart';
import 'package:portfolio_app/utilities/strings.dart';
import 'package:portfolio_app/widgets/icon_widgets.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopContactPage();
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return TabletContactPage();
      } else {
        return MobileContactPage();
      }
    });
  }
}

class DesktopContactPage extends StatefulWidget {
  @override
  _DesktopContactPageState createState() => _DesktopContactPageState();
}

class _DesktopContactPageState extends State<DesktopContactPage> {
  var width;
  var height;
  var utilityProvider;
  var themeProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    return Container(
      width: width,
      //height: height,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
          ),
          emailContactWidget(200, 0.6 * width, 18, 35),
          SizedBox(
            height: 60,
          ),
          websiteIcon(),
          SizedBox(
            height: 60,
          ),
          navBarItems(scrollController),
          SizedBox(
            height: 60,
          ),
          iconBarWidget(),
          SizedBox(
            height: 60,
          ),
          footerWidget(themeProvider, scrollController)
        ],
      ),
    );
  }
}

class TabletContactPage extends StatefulWidget {
  @override
  _TabletContactPageState createState() => _TabletContactPageState();
}

class _TabletContactPageState extends State<TabletContactPage> {
  var width;
  var height;
  var utilityProvider;
  var themeProvider;
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    return Container(
      width: width,
      //height: height,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
          ),
          emailContactWidget(200, 0.8 * width, 18, 28),
          SizedBox(
            height: 60,
          ),
          websiteIcon(),
          SizedBox(
            height: 60,
          ),
          navBarItems(scrollController),
          SizedBox(
            height: 60,
          ),
          iconBarWidget(),
          SizedBox(
            height: 60,
          ),
          footerWidget(themeProvider, scrollController)
        ],
      ),
    );
  }
}

class MobileContactPage extends StatefulWidget {
  @override
  _MobileContactPageState createState() => _MobileContactPageState();
}

class _MobileContactPageState extends State<MobileContactPage> {
  var width;
  var height;
  var utilityProvider;
  var themeProvider;
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    return Container(
      width: width,
      //height: height,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
          ),
          emailContactWidget(200, 0.8 * width, 16, 20),
          SizedBox(
            height: 60,
          ),
          websiteIcon(),
          SizedBox(
            height: 60,
          ),
          navBarItems(scrollController),
          SizedBox(
            height: 60,
          ),
          iconBarWidget(),
          SizedBox(
            height: 60,
          ),
          footerWidget(themeProvider, scrollController)
        ],
      ),
    );
  }
}

Widget emailContactWidget(double height, double width, double sayHelloFontSize,
    double emailIDFontSize) {
  return Material(
    elevation: 15,
    //color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: height,
      width: width,
      //color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kContactCardTitle,
            style: TextStyle(fontSize: sayHelloFontSize, color: Colors.grey),
          ),
          Text(
            kEmail,
            style: TextStyle(
                fontSize: emailIDFontSize, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget footerWidget(
    ThemeProvider themeProvider, ScrollController scrollController) {
  return Container(
    height: 100,
    color: Colors.grey.withOpacity(0.1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      kRightsReserved,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                //mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.border_left_outlined),
                      onPressed: () async {
                        await scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.ease);
                        themeProvider.toggleTheme();
                      }),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget iconBarWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      iconWidget('linkedin'),
      SizedBox(
        width: 20,
      ),
      iconWidget('twitter'),
      SizedBox(
        width: 20,
      ),
      iconWidget('github'),
    ],
  );
}

Widget websiteIcon() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      mainAxisSize: MainAxisSize.max,
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
    ),
  );
}

Widget navBarItems(ScrollController scrollController) {
  return Row(
    // mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      navBarOptions(kAbout, 1, () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent + 120,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      }),
      SizedBox(
        width: 40,
      ),
      navBarOptions(kServices, 2, () {
        scrollController.animateTo(
          0.30 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      SizedBox(
        width: 40,
      ),
      navBarOptions(kPortfolio, 3, () {
        scrollController.animateTo(
          0.60 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      SizedBox(
        width: 40,
      ),
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
    //hoverColor: Colors.grey[200],
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
