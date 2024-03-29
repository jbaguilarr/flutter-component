import 'package:flutter/material.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en','US'), // English
          const Locale('es','ES'), // Hebrew
        ],
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoute(),
      onGenerateRoute: (RouteSettings settings){
          return MaterialPageRoute(
             builder: (BuildContext context) => AlertPage()
          );
      },
    );
  }
}