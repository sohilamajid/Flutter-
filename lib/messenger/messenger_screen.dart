import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision_1/const.dart';
import 'package:flutter_revision_1/messenger/models/messenger_model.dart';
import 'json_files/messenger_json.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MessengerModel> apiList = messengerJson.map((e) => MessengerModel.fromJson(e)).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchBuilder(),
              SizedBox(height: 20,),
              _storiesBuilder(),
              SizedBox(height: 20,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: apiList.length,
                  separatorBuilder: (context,index) => SizedBox(height: 10,),
                  itemBuilder: (context, index) =>
                    _buildChatItem(
                        name: apiList[index].name??"",
                        image: apiList[index].image??"",
                        message: apiList[index].message??"",
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }





  Widget _buildChatItem({
    required String name ,
    required String image ,
    required String message ,
    //required IconType icon ,
  }) {
    return Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 2,),
                  Text(message,style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
                ],
              ),
              Spacer(),
              Icon(
                CupertinoIcons.check_mark_circled,
                color: Colors.grey,),
            ],
          );
  }

  Widget _searchBuilder() {
    return Container(
            height: 50,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Icon(Icons.search,color: Colors.grey,),
                SizedBox(width: 5,),
                Text("Search"),
              ],
            ),

          );
  }

  Widget _storiesBuilder() {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.add,color: Colors.black,),
                  ),
                  Text("Your Story"),
                ],
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Container(
                  height: 80,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: 20,
                      separatorBuilder: (context,index)=> SizedBox(width: 10,),
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 26,
                                child: CircleAvatar(
                                  radius: 23, backgroundImage: NetworkImage(avatarImage),
                                ),
                              ),
                            ),
                            Text("Sohila"),
                          ],
                        );
                      }
                  ),
                ),
              ),
            ],
          );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,//to delete the line between appBar and body
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 8),
        child: CircleAvatar(backgroundImage: AssetImage("assets/images/avatar1.jpg"),),

      ),
      title: Text(
        "Chats",style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),),
      actions: [
        _buildAppBarAction(icon: CupertinoIcons.camera_fill),
        const SizedBox(width: 10,),
        _buildAppBarAction(icon: Icons.edit),
        const SizedBox(width: 15,),
      ],

    );
  }

  Widget _buildAppBarAction({required IconData icon}) {
    return CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.15),
            child: Icon(icon,color: Colors.black));
  }
}
