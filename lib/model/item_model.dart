import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Item extends ChangeNotifier {
  String name;
  String id;
  String image;
  String description;
  bool isFavorite = false;

  Item(
      {required this.name,
      required this.id,
      required this.image,
      required this.description});

  void toggleIsFavourite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'image': image,
      'description': description,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      id: map['id'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
