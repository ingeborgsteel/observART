import 'package:flutter/material.dart';
import 'package:hvart_har_du_sett/constants/app_constants.dart';
import 'package:hvart_har_du_sett/screens/terrain_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const TerrainMap(),
    );
  }
}
