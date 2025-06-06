//import 'package:expencetracker/model/Notes.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/Splash.dart';

var kDarkColor = ColorScheme.fromSeed(
  seedColor: Colors.black,
  brightness: Brightness.dark,
);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColor,
      ),
      theme: ThemeData().copyWith(), //it use to add material3 design

      themeMode: ThemeMode.system,
      home: Splash(),
      //MyRegister(),
      //Notes(),
    ),
  );
  // });
  // runApp(
  //   MaterialApp(
  //     darkTheme: ThemeData.dark().copyWith(
  //       useMaterial3: true,
  //       colorScheme: kDarkColor,
  //     ),
  //     theme: ThemeData().copyWith(), //it use to add material3 design

  //     themeMode: ThemeMode.system,
  //     home: Notes(),
  //   ),
  // );
}
