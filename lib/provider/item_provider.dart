import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/item_model.dart';

class Item_Provider extends ChangeNotifier {
  List<Item> _items = [
    Item(
        name: 'XXXX',
        id: '1',
        image:
            'https://images.unsplash.com/photo-1712939703035-2c4d0a1e8a23?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Item(
        name: 'XXXX',
        id: '2',
        image:
            'https://images.unsplash.com/photo-1714802145430-3b1f666dca37?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Item(
        name: 'XXXX',
        id: '3',
        image:
            'https://images.unsplash.com/photo-1714807241573-e843a80d081a?q=80&w=3388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
  ];

  List<Item> get items {
    return [..._items];
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/items.json');
    final parsedList = await json.decode(response);
    var ListData =
        parsedList.map((data) => Item.fromJson(jsonEncode(data))).toList();
    print(ListData);
  }
}
