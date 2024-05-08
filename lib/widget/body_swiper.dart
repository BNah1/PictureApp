import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/item_provider.dart';

class Body_Swiper extends StatelessWidget {
  const Body_Swiper({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Item_Provider>(context).items;
    return Swiper(
      layout: SwiperLayout.STACK,
      itemHeight: 600,
      itemWidth: 300,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.white12,
              title: InkWell(
                onTap: () {
                  // Provider.of<Item_Provider>(context, listen: false)
                  //     .updateFavourite();
                },
                child: Icon(
                  Icons.favorite,
                  size: 30,
                ),
              ),
              subtitle: Text('Like this'),
              trailing: Text(
                items[index].name,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            child: Image.network(
              items[index].image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
