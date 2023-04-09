



import 'package:blockdeepdive/views/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BlockDeepDive());
}

class BlockDeepDive extends StatefulWidget {
  const BlockDeepDive({ Key? key }) : super(key: key);

  @override
  _BlockDeepDiveState createState() => _BlockDeepDiveState();
}

class _BlockDeepDiveState extends State<BlockDeepDive> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
      ) ,
      home:Home()
    );
  }
}