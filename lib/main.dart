import 'package:abc_puzzles/disney_cartoon/disney_cartoon.dart';
import 'package:abc_puzzles/mickey_mouse/mickey_mouse.dart';
import 'package:abc_puzzles/model.dart';
import 'package:abc_puzzles/tiger_cartoon/tiger_cartoon.dart';
import 'package:abc_puzzles/tom_cartoon/tom_cartoon.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //select any of these
      home:DisneyCartoons(),
        //home:MickeyMouse()
      //home: TigerCartoon(),
      //home:TomCartoon(),
    );
  }
}

