
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/constants/constants.dart';
import 'package:todo_app/data/models/task_model.dart';


class HomePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Testing Sample'),
      actions: <Widget>[
        TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.white),
          onPressed: () {
             Navigator.pushNamed(context, RouteConstants.compeleteTask);
          },
          icon: Icon(Icons.favorite_border),
          label: Text('Favorites'),
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: 100,
      cacheExtent: 20.0,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => ItemTile(index),
    ),
  );
}
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo,);

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesList.items.contains(itemNo)
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNo)
                ? favoritesList.add(itemNo)
                : favoritesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNo)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}