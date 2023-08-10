import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../controller/cartController.dart';
import '../data/data.dart';
class Detailscreen extends StatefulWidget {
  // const Detailscreen({super.key});
  final int index;
  final data product;
  final CartController controller;
  Detailscreen(
      {required this.index, required this.product, required this.controller});
  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  final cartController = Get.put(CartController());
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        color: Color.fromARGB(255, 160, 160, 160),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 430,
                      //color: Colors.red,
                      child: Image.asset(
                        "${widget.product.images}",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: FloatingActionButton(
                            backgroundColor: Colors.black,
                            onPressed: () {
                              Get.back();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.43),
                  height: MediaQuery.of(context).size.height * 0.57,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "${widget.product.title}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i <= 5; i++)
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "5.0",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "(7.932 reviews)",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.lightBlue),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height*0.2,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    key: const Key('showMore'),
                                    padding: const EdgeInsets.all(16.0),
                                    child: ReadMoreText(
                                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                      trimLines: 2,
                                      preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                                      style: TextStyle(color: Colors.black,fontSize: 18),
                                      colorClickableText: Colors.black,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: '...Read More',moreStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                      trimExpandedText: ' show less',lessStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Choose Size",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    Container(
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(width: 1,color: Colors.black45),
                                            ),
                                            child: FloatingActionButton(
                                              backgroundColor: Colors.white,
                                              onPressed: () {},
                                              child: Text("S",style: TextStyle(color: Colors.black),)
                                            ),
                                          ),
                                    
                                    
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(width: 1,color: Colors.black45),
                                            ),
                                            child: FloatingActionButton(
                                              backgroundColor: Colors.white,
                                              onPressed: () {},
                                              child: Text("M",style: TextStyle(color: Colors.black),)
                                            ),
                                          ),
                                    
                                    
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(width: 1,color: Colors.black45),
                                            ),
                                            child: FloatingActionButton(
                                              backgroundColor: Colors.white,
                                              onPressed: () {},
                                              child: Text("L",style: TextStyle(color: Colors.black),)
                                            ),
                                          ),
                                    
                                    
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(width: 1,color: Colors.black45),
                                            ),
                                            child: FloatingActionButton(
                                              backgroundColor: Colors.white,
                                              onPressed: () {},
                                              child: Text("XL",style: TextStyle(color: Colors.black),)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        
                              Container(
                                height: 60,
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Color",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    Container(
                                      width: 120,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.grey
                                            ),
                                          ),
                                    
                                    
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.black87
                                            ),
                                          ),
                                    
                                    
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                        width: MediaQuery.of(context).size.width*1,
                        height: 70,
                        decoration: BoxDecoration(
                            color:Colors.black87,
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: TextButton(
                            onPressed: (){
                              cartController.addProduct(data.datas[widget.index]);
                              Get.back();
                            }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.card_travel,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Add to Cart|",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("\$${data.datas[widget.index].price}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                              ],
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
