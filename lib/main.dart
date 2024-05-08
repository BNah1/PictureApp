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

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<Item_Provider>(context, listen: false).readJson();
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //     padding: EdgeInsets.all(15),
        //     child: Consumer<Item_Provider>(
        //       builder: (context, item, child) {
        //         return Badge(
        //             label: Text(item.favourite.toString()),
        //             child: Icon(Icons.favorite));
        //       },
        //     )
        // ),
        title: Center(child: const Text('data')),
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(child: Text('xxx')),
                    PopupMenuItem(child: Text('xxx')),
                    PopupMenuItem(child: Text('xxx'))
                  ])
        ],
        elevation: 10,
        shadowColor: Colors.pink,
      ),
      body: Body_Swiper(),
    );
  }
}
