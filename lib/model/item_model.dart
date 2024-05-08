import 'dart:convert';

class Item {
  String name;
  String id;
  String image;

  Item({required this.name, required this.id, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      id: map['id'] as String,
      image: map['image'] as String,
    );
  }
  String toJson() => json.encode(toMap());
  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
