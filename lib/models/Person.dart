



import 'package:flutter/material.dart';

@immutable
class Person {
  
  final String _name;
  final int _age;
  const  Person({required String name, required int age}) : _name = name , _age = age;


}