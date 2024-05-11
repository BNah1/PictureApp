import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/item_model.dart';

class Item_Provider extends ChangeNotifier {
  List<Item> _items = [];
  int _countItemFavourite = 0;

  List<Item> get items {
    return [..._items];
  }

  int get countItemFavourite {
    return _countItemFavourite;
  }

  void handleCountItemFav() {
    _countItemFavourite = _items.where((element) => element.isFavorite).length;
    notifyListeners();
  }

  List<Item> showItemFavourite() {
    List<Item> data = _items.where((element) => element.isFavorite).toList();
    return data.isEmpty ? [] : data;
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/items.json');
    final parsedList = await json.decode(response);
    List<Item> ListData = List<Item>.from(
        parsedList.map((data) => Item.fromJson(jsonEncode(data))).toList());
    _items = ListData;
    notifyListeners();
  }
}
