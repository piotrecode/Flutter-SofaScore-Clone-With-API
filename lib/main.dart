import 'package:flutter/material.dart';
import 'package:sofascore/theme/theme.dart';
import 'package:sofascore/widgets/appbar.dart';
import 'package:sofascore/widgets/games_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => Sports(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sofascore',
      theme: myTheme,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(children: [
              const Flexible(child: MyAppBar()),
              GamesWidget(
                selectedSportprov: Provider.of<Sports>(context).selectedSport,
              )
            ]),
          )),
    );
  }
}
