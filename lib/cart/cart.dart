import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:interview/data/data.dart';
import '../controller/cartController.dart';
class cart extends StatelessWidget {
   cart({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        title: Text("Order".tr,style: TextStyle(color: Colors.black),),elevation: 0,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
             // color: Colors.blue,
            height: MediaQuery.of(context).size.height*0.5,
            child: CartProducts()
            ),
           // CartTotal(),

           // processbutton()
            CartTotal(),
            processbutton()
          ],

        ),
      ),
    );
  }
}
class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  final product= Get.put(data);
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=>
      controller.products.length>0 ?
      Expanded(
        child: ListView.builder(
            itemCount: controller.products.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index){
              return Slidable(
                key: UniqueKey(),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(), 
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      onPressed: (context) {
                        controller.removeallproduct(controller.products.keys.toList()[index]);
                      },
                      ),
                  ]
                  ),
                child: Column(
                  children: [
                    CartProductCard(
                      controller: controller,
                      product: controller.products.keys.toList()[index],
                      quantity: controller.products.values.toList()[index],
                      index: index,
                    ),
              
                  ],
                ),
              );
            }
        ),
      ): SizedBox(
        height: 800,
        child: Center(
            child: Text("Cart empty".tr)
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final data product;
  final int quantity;
  final int index;
  const CartProductCard({
    Key? key,required this.index,required this.controller,required this.product,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40,
                    backgroundImage: AssetImage(product.images),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.title}"),
                      Text("${product.price}"),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              controller.removeProduct(product);},
                            icon: const Icon(Icons.remove_circle),
                          ),
                          Text("$quantity"),
                          IconButton(
                            onPressed: (){
                              controller.addProduct(product);},
                            icon: const Icon(Icons.add_circle),
                          ),

                ],
              ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class CartTotal extends StatelessWidget {
final controller = Get.put(CartController());
CartTotal({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return 
  Obx(
        ()=>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: 
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
                        height: 100,
                        width: MediaQuery.of(context).size.width*1,
                        decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                        ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal".tr,style: TextStyle(color: Colors.black,fontSize: 18),),
                                Text("\$${controller.productSubtotal}",style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tax".tr,style: TextStyle(color: Colors.black,fontSize: 18),),
                                Text("\$${controller.tax}",style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ],
                        ),
          ),
            //Dolletd Line
                    Container(
                      width: MediaQuery.of(context).size.width*1,
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          SizedBox(
                            height: 20,
                            width: 9,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              )
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                                    width: 5,height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.grey
                                      )
                                      ),
                                  )),
                                  );
                                },
                              ),
                            )
                            ),
                          SizedBox(
                            height: 20,
                            width: 9,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )
                              )
                              ),
                          ),
                        ],
                      ),
                      ),

                    //Total
                    Container(
                      padding: const EdgeInsets.all(20.0),
                    height: 70,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total".tr,style: TextStyle(color: Colors.black,fontSize: 20,
                            fontWeight: FontWeight.bold),),
                         Text("\$${controller.total}",style: TextStyle(
                             fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
        ],
      ),
    ),
  );
}
}
class processbutton extends StatelessWidget {
  const processbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
    child: Container(
    width: MediaQuery.of(context).size.width*1,
    height: 50,
    decoration: BoxDecoration(
    boxShadow: [
    BoxShadow(
    blurRadius: 0.1,
    )
    ],
    borderRadius: BorderRadius.circular(20),
    color: Colors.black,
    ),
    child: TextButton(
    onPressed: (){}, child: Text("Process Transaction",style: TextStyle(color: Colors.white),)))
    );}
}