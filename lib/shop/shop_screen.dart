import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/shop/main_screen.dart';
import 'package:flutter_revision_1/shop/product_screen.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green,
        items: [
          Icon(Icons.home, size: 30),
          Icon(CupertinoIcons.book_fill, size: 30),
          Icon(CupertinoIcons.chat_bubble_fill, size: 30),
          Icon(Icons.shopping_cart, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      backgroundColor: Colors.grey[300],
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Catalog",style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(CupertinoIcons.list_bullet),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: ProductScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      leading: InkWell(
        onTap: (){
          Get.to(MainScreen());
        },
          child: Icon(Icons.arrow_back,color: Colors.black,)),
      title: Text("Our Plants",style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      ),
      actions: [
        InkWell(
          onTap: (){
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.search,color: Colors.black,),
          ),
        ),
      ],
    );
  }
}
