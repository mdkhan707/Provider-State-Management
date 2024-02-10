import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/favourite.dart';
import 'package:state_management_provider/screens/Favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selecteditem = [];
  @override
  Widget build(BuildContext context) {
    // final Fprovider = Provider.of<FavouritItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favourite App"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavourite()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouritItem>(
                      builder: (context, keyvalue, child) {
                    return ListTile(
                      onTap: () {
                        if (keyvalue.selecteditem.contains(index)) {
                          keyvalue.removeitem(index);
                        } else {
                          keyvalue.additem(index);
                        }
                      },
                      title: Text('item' + index.toString()),
                      trailing: Icon(keyvalue.selecteditem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
