import 'package:ecommerce/core/my_flutter_app.dart';
import 'package:ecommerce/models/shoes_models.dart';
import 'package:ecommerce/widget/app_cliper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final ShoeModel shoeModel;
  DetailPage(this.shoeModel);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: Text("CATEGORIES"),
        leading: Icon(MyFlutterApp.chevron_left),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget> [
          Positioned(
            bottom: 0,
              child: Container(
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width,
              
              child: ClipPath(
                clipper: AppClipper(cornerSize: 50 , diagonalHeight: 180),
                        child: Container(
                  color : Colors.white ,
                  padding: EdgeInsets.only(top:180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(horizontal:16),
                        child: Text("${widget.shoeModel.name}" , style: TextStyle(
                          fontSize: 32,
                        ),),
                      ),
                      Row(children: [
                      Ratingbar(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
                      ],),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}