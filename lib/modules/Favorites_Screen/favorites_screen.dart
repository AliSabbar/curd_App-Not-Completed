import 'package:curd_app/services/network/remote/api_helper.dart';
import 'package:curd_app/services/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorites Items'),
      ),
      body: FutureBuilder(
        future: Provider.of<CurdProvider>(context).getFav(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator.adaptive());
            case ConnectionState.done:
            default:
              if (snapshot.hasData) {
                return snapshot.data.isEmpty
                    ? const Center(
                        child: Text("Add Some Items"),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => Card(
                              child: ListTile(
                                title: Text(
                                    "${snapshot.data[index].product.name}"),
                                leading: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${snapshot.data[index].product.image}"),
                                          fit: BoxFit.cover)),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      Provider.of<CurdProvider>(context,
                                              listen: false)
                                          .addToFav(
                                              product_id: snapshot
                                                  .data[index].product.id);
                                    },
                                    icon: const Icon(Icons.remove)),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: snapshot.data.length);
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return const Center(child: Text("Fav Screen"));
          }
        },
      ),
    );
  }
}
