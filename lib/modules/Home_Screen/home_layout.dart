import 'package:curd_app/components/appbar.dart';
import 'package:curd_app/services/network/remote/api_helper.dart';
import 'package:curd_app/services/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<CurdProvider>(context, listen: true);
    return Scaffold(
        body: Column(
      children: [
        customAppBar(),
        const SizedBox(
          height: 50,
        ),
        prov.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: prov.myProducts.length,
                    itemBuilder: (BuildContext context, index) {
                      return productItem(prov.myProducts[index]);
                    }),
              ),
      ],
    ));
  }

  Widget productItem(model) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage("${model['image']}"),
                      fit: BoxFit.cover,
                    ))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${model['name']}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\$${model['price']}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
