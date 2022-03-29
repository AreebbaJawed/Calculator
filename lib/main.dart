import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator/calLogic.dart';
import 'calculator/calculator_view.dart';
import 'calculator/theme.dart';
import 'calculator/theme_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
  // Widget build(BuildContext context) => ChangeNotifierProvider (
    //create: (context) => themeProvider(),
    //builder: (context, _) {
      //final ThemeProvider = Provider.of<themeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // themeMode: ThemeProvider.themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: kDarkBackgroundColour,
      ),
      theme: ThemeData(
        canvasColor: kBackgroundColour,
        backgroundColor: Color.fromRGBO(231, 240, 247, 1),
        scaffoldBackgroundColor: Color.fromRGBO(231, 240, 247, 1),
      ),
      home: Builder(
        builder: (BuildContext context) {
          final brightnessValue = MediaQuery.of(context).platformBrightness;
          bool isDark = brightnessValue == Brightness.dark;
          final theme = isDark ? darkNeumorphicTheme : lightNeumorphicTheme;
          return MultiProvider(
            providers: [
              ProxyProvider0<NeumorphicTheme>(update: (_, __) => theme),
              ChangeNotifierProvider<Calculator>(create: (_) => Calculator())
            ],
            child: CalculatorView(),
          );
        },
      ),
    );
  }
  //);
}
