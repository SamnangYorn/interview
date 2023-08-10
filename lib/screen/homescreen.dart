import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/data/data.dart';
import 'package:interview/data/sale.dart';
import 'package:interview/favorite/favoritePage.dart';
import 'package:interview/screen/detailscreen.dart';
import '../cart/cart.dart';
import '../controller/cartController.dart';
import 'package:badges/badges.dart' as badges;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello Welcome",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Alber Stevano",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            child: CupertinoSearchTextField(),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.sort),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),

                //Sales

                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < sale.sales.length; i++)
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                height: 180,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 160, 160, 160),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 150),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          width: 160,
                                          child: Image.asset(
                                            "${sale.sales[i].images}",
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${sale.sales[i].Discount}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${sale.sales[i].title}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${sale.sales[i].subtitle}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        width: 100,
                                                        child: Text(
                                                          "Get Now",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                //NewArrivals
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Arrivals",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text("View All")
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      data detailscreen = data.datas[index];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext) => Detailscreen(
                                              index: index,
                                              product: detailscreen,
                                              controller: controller,
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Stack(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1,
                                                height: 170,
                                                color: Colors.blueGrey,
                                                child: Container(
                                                    child: Image.asset(
                                                  "${data.datas[index].images}",
                                                  fit: BoxFit.fitWidth,
                                                ))),
                                              Container(
                                              margin: EdgeInsets.only(
                                                  left: 125, top: 15),
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(100)),
                                              child: GestureDetector(
                                                onTap: (){
                                                  controller.addfavorite(data.datas[index]);
                                                },
                                                child: Obx(() {
                                                  return controller.liked(data.datas[index])?
                                                  Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ):Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                    size: 20,
                                                  );
                                                })
                                              ),
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${data.datas[index].title}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("${data.datas[index].subtitle}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\$${data.datas[index].price}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    childCount: data.datas.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                ),
              ],
            ),
            //ButtomBar
            Center(
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height)*0.9,
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height*0.062,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 37, 37),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 58, 57, 57),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                          )),
                    ),
                    Obx(() => 
                    badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.black,
                      ),
                      badgeContent: Text("${controller.products.length}".toString(),
                        style: TextStyle(color: Colors.white),),
                      child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 58, 57, 57),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          onPressed: () {
                            Get.to(cart());
                          },
                          icon: Icon(
                            Icons.card_travel,
                            color: Colors.white,
                          )),
                    ),
                    ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 58, 57, 57),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          onPressed: () {
                            Get.to(favoritePage());
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 58, 57, 57),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
