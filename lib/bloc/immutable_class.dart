import 'package:flutter/material.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}


@immutable
abstract class LoadPersonAction extends LoadAction {

  final PersonUrl url;
  const LoadPersonAction({required this.url}) : super();

}

enum PersonUrl {
  person1,
  person2,
}



extension PersonUrlExtension on PersonUrl {
  String get url {
    switch (this) {
      case PersonUrl.person1:
        return 'https://jsonplaceholder.typicode.com/users/1';
      case PersonUrl.person2:
        return 'https://jsonplaceholder.typicode.com/users/2';
    }
  }
}
