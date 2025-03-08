import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/ecommerce/home/product_model.dart';

import '../../const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductItem> products = [
    ProductItem(
      imageUrl: fish ,
      title: 'Big & Small Fishes',
      description: 'Fresh from sea',
      price: '\$36/KG',
    ),
    ProductItem(
      imageUrl: meat,
      title: 'Halal Meats',
      description: 'Organics & Fresh',
      price: '\$90/KG',
    ),
    ProductItem(
      imageUrl: chicken,
      title: 'Chickens',
      description: 'Organics & Fresh',
      price: '\$50/KG',
    ),
  ];
  List<String> categories = [
    'Meats and fishes',
    'Vegetables',
    'Fruits',
    'Breads',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        items: [
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.more_vert, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Column(
          children: <Widget>[
            Container(
              height: height * .35,
              color: Colors.indigo[800],
              child: Padding(
                padding: const EdgeInsets.only(top: 90,left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Hey, Halal",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        ),
                        Spacer(),
                        Icon(Icons.search,size: 20,color: Colors.white,),
                        SizedBox(width: 25,),
                        Icon(Icons.add_shopping_cart,size: 20,color: Colors.white,),
                        SizedBox(width: 10,),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(textAlign: TextAlign.start,"Shop",style: TextStyle(
                      fontSize: 35,
                      color: Colors.white.withOpacity(.7),
                    ),
                    ),
                    SizedBox(height: 5,),
                    Text("By Category",style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * .04,
                color: Colors.white,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  itemBuilder: (context,index)=> _listItems(categories[index]),
                ),
              ),
            ),
            // SizedBox(height: 5,),
            Container(
              color: Colors.white,
              child: Container(
                width: width * .9,
                height: height * .45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.withOpacity(.5),width:.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  separatorBuilder: (context,index)=>SizedBox(height: .5,),
                  itemBuilder: (context,index) {
                    if (index >= 0 && index < products.length) {
                      return _buildItems(
                        MediaQuery.of(context).size.height,
                        products[index],
                      );
                    } else {
                      return SizedBox();
                    }
                  },

                ),
              ),
            ),

          ]
      ),
    );
  }

  Widget _buildItems(double height,ProductItem product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: height * .21,
            width: 120,
            child: Image.network(product.imageUrl)),
        SizedBox(width: 20,),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( product.title,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10,),
              Text( product.description,style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(.5),
              ),
              ),
              SizedBox(height: 20,),
              Text("Starting from",style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(.3),
              ),
              ),
              SizedBox(height: 10,),
              Text( product.price,style: TextStyle(
                fontSize: 15,
                color: Colors.blue[800],
              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _listItems(String category){
    return Container(
      height: 90,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black,width:.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(textAlign: TextAlign.center,category,style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
    );
  }

}
