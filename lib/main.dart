import 'package:flutter/material.dart';
import 'package:portfolio_app/pages/homepage/home_page.dart';
import 'package:portfolio_app/providers/utility_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider())
    ],
    child: MaterialApp(
        title: 'Khurram Rizvi | Portfolio',
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: PortfolioApp()),
  ));
}

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  var utilityProvider;
  double deviceWidth;
  double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomePage());
  }
}
