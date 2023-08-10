import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cartController.dart';

class favoritePage extends StatelessWidget {
  const favoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Favorite"),
      ),
      body: Obx(()=>
         ListView.builder(
            itemCount: cartController.isliked.length,
            itemBuilder: (BuildContext context,index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                ListTile(
                  title: Text("${cartController.isliked[index].title}"),
                  subtitle: Text("${cartController.isliked[index].price}"),
                  trailing: IconButton(
                    onPressed: (){
                      cartController.deletefavorite(cartController.isliked.toList()[index]);
                    },
                    icon: Icon(Icons.delete),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 30,
                    backgroundImage: AssetImage("${cartController.isliked[index].images}"),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}