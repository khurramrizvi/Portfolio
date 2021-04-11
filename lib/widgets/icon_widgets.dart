import 'package:flutter/material.dart';
import 'package:portfolio_app/utilities/strings.dart';
import 'package:url_launcher/url_launcher.dart';

Widget iconWidget(String iconName) {
  if (iconName == 'linkedin') {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      hoverColor: Colors.blue.withOpacity(0.5),
      child: Container(
          width: 48,
          height: 48,
          child: Container(
              width: 48,
              height: 48,
              child: Image(image: AssetImage('lib/icons/linkedin_2x.png')))),
      onTap: () {
        launchUrl(kLinkedInURL);
      },
    );
  } else if (iconName == 'twitter') {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      hoverColor: Colors.lightBlueAccent.withOpacity(0.5),
      onTap: () {
        launchUrl(kTwitterURL);
      },
      child: Container(
          width: 48,
          height: 48,
          child: Image(image: AssetImage('lib/icons/twitter_2x.png'))),
    );
  } else {
    return InkWell(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        hoverColor: Colors.grey.withOpacity(0.3),
        onTap: () {
          launchUrl(kGithubURL);
        },
        child: Container(
            width: 48,
            height: 48,
            child: Image(image: AssetImage('lib/icons/github_2x.png'))));
  }
}

launchUrl(String obtainedUrl) async {
  final String url = obtainedUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
