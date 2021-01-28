import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_app/utilities/strings.dart';
import 'package:portfolio_app/widgets/icon_widgets.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopAboutMe();
        } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
          return TabletAboutMe();
        } else {
          return MobileAboutMe();
        }
      },
    );
  }
}

class DesktopAboutMe extends StatefulWidget {
  @override
  _DesktopAboutMeState createState() => _DesktopAboutMeState();
}

class _DesktopAboutMeState extends State<DesktopAboutMe> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
        //padding: EdgeInsets.only(left: 0.14 * width, right: 0.09 * width),
        height: height,
        width: width,
        //padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32),
        child: stackedWidgets(height, width));
  }
}

class MobileAboutMe extends StatefulWidget {
  @override
  _MobileAboutMeState createState() => _MobileAboutMeState();
}

class _MobileAboutMeState extends State<MobileAboutMe> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        height: 1 * height,
        width: width,
        //padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            nameWidget(40, 15),
            SizedBox(
              height: 40,
            ),
            // myImageWidget(height / 1.5, width / 2)
            Container(
              height: 0.6 * height,
              //width: 0.4 * width,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  kProfileImageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            )
          ],
        ));
  }
}

class TabletAboutMe extends StatefulWidget {
  @override
  _TabletAboutMeState createState() => _TabletAboutMeState();
}

class _TabletAboutMeState extends State<TabletAboutMe> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      //padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32),
      // padding: EdgeInsets.only(left: 0.001 * width, right: 0.02 * width),
      child: tabletViewWidget(width, height),
    );
  }
}

//common name and description widget
Widget nameWidget(double nameFontSize, double descFontSize) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        kHello,
        style: TextStyle(fontSize: nameFontSize, fontWeight: FontWeight.w600),
      ),
      Text(
        kName,
        style: TextStyle(fontSize: nameFontSize, fontWeight: FontWeight.w600),
      ),
      Text(
        kDescription,
        style: TextStyle(fontSize: descFontSize, color: Colors.blueGrey[400]),
      ),
    ],
  );
}

//image widget
Widget myImageWidget(double height, double width) {
  return Container(
    height: 0.5 * height,
    //width: 0.4 * width,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        kProfileImageURL,
        fit: BoxFit.cover,
      ),
    ),
  );
}

//shapes for desktop view only
Widget circleShape(double width, double height, Color color) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color.withOpacity(0.4),
      shape: BoxShape.circle,
    ),
  );
}

//all stacked widgets used for desktop view
Widget stackedWidgets(double height, double width) {
  return Stack(
    children: [
      //random circles
      Positioned(
          top: 0.2 * height,
          left: 0.065 * width,
          child: circleShape(200, 200, Colors.redAccent)),

      Positioned(
          top: 0.1 * height,
          left: 0.55 * width,
          child: circleShape(60, 60, Colors.tealAccent)),

      Positioned(
          top: 0.1 * height,
          left: 0.35 * width,
          child: circleShape(60, 60, Colors.cyanAccent)),

      Positioned(
          top: 0.2 * height,
          left: 0.40 * width,
          child: circleShape(300, 300, Colors.yellowAccent)),

      Positioned(
          top: 0.65 * height,
          left: 0.35 * width,
          child: circleShape(100, 100, Colors.tealAccent)),

      Positioned(
          top: 0.28 * height, left: 0.12 * width, child: nameWidget(60, 20)),

      //top yellow circle
      Positioned(
          top: 0.012 * height,
          right: 0.04 * width,
          child: circleShape(200, 200, Colors.yellowAccent)),

      //top red circle
      Positioned(
          top: 0.07 * height,
          right: 0.065 * width,
          child: circleShape(60, 60, Colors.redAccent)),

      Positioned(
          // height: 10 * height,
          // width: 10 * width,
          top: 0.10 * height,
          right: 0.08 * width,
          child: myImageWidget(height, width)),

      Positioned(
          // height: 10 * height,
          // width: 10 * width,
          top: 0.70 * height,
          right: 0.20 * width,
          child: iconWidget('linkedin')),

      Positioned(
          // height: 10 * height,
          // width: 10 * width,
          top: 0.70 * height,
          right: 0.16 * width,
          child: iconWidget('twitter')),

      Positioned(
          // height: 10 * height,
          // width: 10 * width,
          top: 0.70 * height,
          right: 0.12 * width,
          child: iconWidget('github')),
    ],
  );
}

//tablet view code simplification
Widget tabletViewWidget(double width, double height) {
  return Container(
      padding: EdgeInsets.only(left: 0.02 * width, right: 0.02 * width),
      height: height,
      width: width,
      //padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          nameWidget(50, 20),
          SizedBox(
            height: 60,
          ),
          myImageWidget(height / 1, width / 2),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
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
            ),
          )
        ],
      ));
}

// Widget iconWidget(String iconName) {
//   if (iconName == 'linkedin') {
//     return Image(image: AssetImage('lib/icons/linkedin.png'));
//   } else if (iconName == 'twitter') {
//     return Image(image: AssetImage('lib/icons/twitter.png'));
//   } else {
//     return Image(image: AssetImage('lib/icons/github.png'));
//   }
// }
