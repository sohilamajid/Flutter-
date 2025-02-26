
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  String title = "Browse all the category";
  String image = "assets/images/boarding1.jpg";
  String description = "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .";
  int index = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(image,fit: BoxFit.fill,)),
              Text(title,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              Text(
                description,
                textAlign:TextAlign.center,
                style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),),
              InkWell(
                onTap: (){
                  _onChangeOnBoarding();
                },
                child: Container(
                    height: 90,
                    width: 90,
                    child: Image.asset("assets/images/skip1.jpg",fit: BoxFit.fill,)),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _onChangeOnBoarding(){
    index++;
    title = titleList[index];
    description = descList[index];
    image = "assets/images/boarding${index+1}.jpg";
    setState(() {

    });
  }
}
List titleList = [
  "Browse all the category",
  "Amazing Discounts & Offers",
  "On-demand delivery",
];

List descList = [
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
];
