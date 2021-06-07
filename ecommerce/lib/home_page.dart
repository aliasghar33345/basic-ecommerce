import 'package:ecommerce/core/my_flutter_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 
 @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget> [
           Text("categories"),
           IconButton(icon: Icon(MyFlutterApp.search), onPressed: null)
          ],
        )
      ],),
    );
  }
}