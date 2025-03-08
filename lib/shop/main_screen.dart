import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/shop/shop_screen.dart';

import '../const.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List imageList = [
    {"id": 1, "image_path": shopping1},
    {"id": 2, "image_path": shopping2},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  Color backgroundColor = Colors.indigo[800]!;
  Color buttonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    if (currentIndex == 0) {
      backgroundColor = Colors.indigo[800]!;
      buttonColor = Colors.white;
    } else if (currentIndex == 1) {
      backgroundColor = Colors.indigo[400]!;
      buttonColor = Colors.blue[200]!;
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRowText(),
            SizedBox(height: 20,),
            Text("There's something for everyone\n to enjoy with Sweet Shop\n Favourites",style:
            TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(.5),
            ),
            ),
            SizedBox(height: 30,),
            _buildPositioned(),
            SizedBox(height: height * .2,),
            _buildStack(),
            SizedBox(height: 70,),
            Center(
              child: _buildButton(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildRowText() {
    return Row(
      children: [
        Text(
          "Your holiday\nshopping\ndelivered to your home",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 60,left: 0.0),
          child: Icon(
            Icons.houseboat_rounded,
            size: 24.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPositioned() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: imageList.asMap().entries.map((entry) {
        // print(entry);
        // print(entry.key);
        return GestureDetector(
          onTap: () => carouselController.animateToPage(entry.key),
          child: Container(
            width: currentIndex == entry.key ? 35 : 25,
            height: 5.0,
            margin: const EdgeInsets.symmetric(
              horizontal: 2.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: currentIndex == entry.key
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStack() {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imageList.map(
                  (item) => Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(item['image_path'],
                  fit: BoxFit.contain,
                ),
              ),).toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              aspectRatio: 16/9,
              viewportFraction: .8,
              onPageChanged: (index,reason){
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * .5 ,
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopScreen()),
                );
              },
              child : Text("Get Started",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 30,),
            Icon(Icons.arrow_forward_rounded,size: 20,),
          ],
        ),
      ),
    );
  }
}
