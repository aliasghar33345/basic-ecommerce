import 'package:ecommerce/core/const.dart';
import 'package:ecommerce/core/my_flutter_app.dart';
import 'package:ecommerce/models/shoes_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 
 @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        leading: Icon(
          MyFlutterApp.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(children: <Widget> [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
             Text("categories",style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 32,
             ),
             ),
             IconButton(icon: Icon(MyFlutterApp.search , color: Colors.black26,), onPressed: null)
            ],
          ),
        ),
        Text("Display Slider"),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: 
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
         
            Text("Just For you",style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),),
            Text("View All" , style: TextStyle(color: AppColors.greenColor,fontSize: 12),),
        ],)
        ),
        SizedBox(height: 24),
       ...shoeList.map((data){
          return Container(
            margin: EdgeInsets.only(left:16 , right:16 , bottom:10),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  
                ),
              ],
            ),
            child: Row(children: <Widget> [
              Image(
                  image: AssetImage("assets/${data.imgPath}"),
                  width: 100,
                  height: 60,
              ),
              SizedBox(width: 16),
              Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 4,

                        child: Text("${data.name}"
                        ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                      ),
                      Text("${data.brand}",
                   style: TextStyle(
                     color: Colors.black26,
                     height: 1.6
                   ),),
                ],
                ),
              ) ,    
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                   "\$${data.price.toInt()}",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18
                   ),
                ),
              ) ,
            ],
            ),
          );
      }),
      ],),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
             topLeft: Radius.circular(30),
             topRight: Radius.circular(30)
          ),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,

            )
          ]
        ),
        child: BottomNavigationBar
         
        (
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black26,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(MyFlutterApp.compass),
          ), title: Text("data"),),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.format_list_bulleted), title: Text("data"),),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.shopping_basket), title: Text("data"),),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.person), title: Text("data"),)
        ],),
      ),


    );
  }
}