import 'package:ecommerce/core/const.dart';
import 'package:ecommerce/core/my_flutter_app.dart';
import 'package:ecommerce/detail_page.dart';
import 'package:ecommerce/models/shoes_models.dart';
import 'package:ecommerce/widget/app_cliper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        Container(
          height: 300,
          margin: EdgeInsets.symmetric(vertical:16),
          child: ListView.builder(
            itemCount: shoeList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal:16),
            itemBuilder: (context, index){
              return  GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                   MaterialPageRoute(builder: (_) => DetailPage(
                     shoeList[index],
                   ),
                   ),
                  );
                },
                              child: Container(
                  width: 230,
                  margin: EdgeInsets.only(right:15),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: _buildbackground(index , 230),
                      ),
                      Positioned(
                        bottom: 130,
                        right: 10,
                          child: Transform.rotate(
                          angle: -math.pi / 7 ,
                            
                            child: Image(
                            width: 220,
                            image: AssetImage("assets/${shoeList[index].imgPath}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              
          }),
        ),
       SizedBox(height: 16),
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
          return GestureDetector(
             onTap: (){
                  Navigator.of(context).push(
                   MaterialPageRoute(builder: (_) => DetailPage(
                     data,
                   ),
                   ),
                  );
                },
                      child: Container(
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

  Widget _buildbackground(int index , double width)
    
 {
    return ClipPath(
        clipper: AppClipper(
          cornerSize: 25 , diagonalHeight: 180,
        ) ,
                  child: Container(
              color: shoeList[index].color,
              width: width,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Icon(
                              shoeList[index].brand == "Nike" ? MyFlutterApp.check : MyFlutterApp.stars
                              ,
                            size: 30,
                            color: Colors.white,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                           Container(
                             width: 125,
                             child: Text("${shoeList[index].name}",
                             style: TextStyle(
                               color:Colors.white,
                               
                             ),
                             ),
                           ),
                           SizedBox(height:10),
                           Text("${shoeList[index].price}",
                           style: TextStyle(
                             color:Colors.white,
                             fontWeight: FontWeight.bold
                           ),
                           ),
                           SizedBox(height: 16,),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                        child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor ,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            MyFlutterApp.add,
                            color: Colors.white,
                          ),
                          ),
                      ),
                    ),
                  ],
                ),
        ),
      );
  }
}