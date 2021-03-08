import 'package:flutter/material.dart';
import 'package:portfolio_app/utilities/strings.dart';
import 'package:url_launcher/url_launcher.dart';

Widget iconWidget(String iconName) {
  if (iconName == 'linkedin') {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      hoverColor: Colors.blue.withOpacity(0.5),
      child: Image(image: AssetImage('lib/icons/linkedin.png')),
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
      child: Image(image: AssetImage('lib/icons/twitter.png')),
    );
  } else {
    return InkWell(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        hoverColor: Colors.grey.withOpacity(0.3),
        onTap: () {
          launchUrl(kGithubURL);
        },
        child: Image(image: AssetImage('lib/icons/github.png')));
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
