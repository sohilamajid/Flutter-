import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/shop/shop_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 20.0,
          mainAxisExtent: 220,
        ),
        itemCount: gridMap.length,
        itemBuilder: (_,index){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: Image.asset(
                        "${gridMap.elementAt(index)['images']}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${gridMap.elementAt(index)['title']}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                      SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Text("${gridMap.elementAt(index)['price']}",style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),),
                          Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(CupertinoIcons.cart_fill,size: 20,color: Colors.grey[600],),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
