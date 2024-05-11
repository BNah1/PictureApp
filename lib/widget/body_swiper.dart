import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/item_provider.dart';

import '../model/item_model.dart';

class Body_Swiper extends StatelessWidget {
  Body_Swiper({Key? key, required this.isFavourite}) : super(key: key);

  final isFavourite;
  @override
  Widget build(BuildContext context) {
    final dataItem = Provider.of<Item_Provider>(context);
    final items = isFavourite ? dataItem.showItemFavourite() : dataItem.items;
    return items.isNotEmpty
        ? Swiper(
            layout: SwiperLayout.STACK,
            itemHeight: 600,
            itemWidth: 300,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (BuildContext context, index) {
              return ChangeNotifierProvider.value(
                value: items[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black12,
                      title: Text(
                        items[index].name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      subtitle: Text('Like this'),
                      leading: Consumer<Item>(builder: (context, item, child) {
                        return InkWell(
                          onTap: () {
                            item.toggleIsFavourite();
                            Provider.of<Item_Provider>(context, listen: false)
                                .handleCountItemFav();
                            // Provider.of<Item_Provider>(context, listen: false)
                            //     .updateFavourite();
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                            color: item.isFavorite ? Colors.red : Colors.white,
                          ),
                        );
                      }),
                      trailing: Text(
                        'xxxxxxxxx',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: Image.network(
                      items[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
              child: Text('not image'),
            ),
          );
  }
}
