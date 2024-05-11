import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/item_provider.dart';
import 'package:untitled/widget/body_swiper.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => Item_Provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      )));
}

enum fillterOption { all, favourite }

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFavourite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Item_Provider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.all(15),
            child: Consumer<Item_Provider>(
              builder: (context, item, child) {
                return Badge(
                    label: Text(item.countItemFavourite.toString()),
                    child: Icon(Icons.favorite));
              },
            )),
        title: Center(child: const Text('data')),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                setState(() {
                  if (value == fillterOption.all) {
                    isFavourite = false;
                  } else {
                    isFavourite = true;
                  }
                  ;
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: fillterOption.all,
                    ),
                    PopupMenuItem(
                      child: Text('Favourite'),
                      value: fillterOption.favourite,
                    ),
                  ])
        ],
        elevation: 10,
        shadowColor: Colors.pink,
      ),
      body: Body_Swiper(
        isFavourite: isFavourite,
      ),
    );
  }
}
