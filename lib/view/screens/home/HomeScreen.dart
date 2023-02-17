import 'dart:convert';
import 'dart:math';
import 'package:skeletons/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news/controller/apicontroller.dart';
import 'package:news/model/apimodel.dart';
import 'package:http/http.dart' as http;
import 'package:news/view/component/NewsCard.dart';
import 'package:onboarding/onboarding.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CarouselController buttonCarouselController = CarouselController();

  bool _moreBusiVisible=true;
  bool _lessBusiVisible=false;
  bool _moreSpoVisible=true;
  bool _lessSpoVisible=false;

var businessNum = 2;
var sportsNum = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: SvgPicture.asset(logoSmall),
        actions: [IconButton(onPressed: (){
          print("search");
        }, icon: Icon(
          Icons.search,color:black,size:33
        ))],

      ),
      body:

      SingleChildScrollView(

        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
            future:ApiController.fetchCategoryArticles("general"), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return (snapshot.hasData)?
              Container(
                  child: CarouselSlider.builder(itemCount: 4,
                    itemBuilder: (BuildContext context, int index,
                        int realIndex) {
                      return
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  "${snapshot.data[index].urlToImage}",
                                  height:
                                  MediaQuery.of(context).size.height /
                                      2,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 20,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        margin: EdgeInsets.all(5),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${snapshot.data[index].name}",
                                            style: TextStyle(
                                                color: white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                        color:
                                        Colors.black.withOpacity(0.5),
                                      ),
                                      Card(
                                        margin: EdgeInsets.all(5),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${snapshot.data[index].title}",
                                            style: TextStyle(
                                                color: white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ),
                                        color:
                                        Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        );
                    }
                    ,
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,


                        scrollDirection: Axis.horizontal,
                      )
                  )
,            ):SkeletonListView(itemCount: 12, padding: EdgeInsets.all(20), scrollable: true,);
            }),Padding(
        padding: const EdgeInsets.all(8.0),
    child: Text("Business", style: TextStyle(
    fontSize: textFont26, fontWeight: FontWeight.w800),
    textAlign: TextAlign.left,),
    ),
      FutureBuilder(future: ApiController.fetchCategoryArticles("business"),
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
        return (snapshot.hasData)?
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount: businessNum,
           itemBuilder: (BuildContext context, int index) {
             return NewsCard(
               newsImage: (snapshot.data[index].urlToImage==null )? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                   : snapshot.data[index].urlToImage
                   ,
               newsText: (snapshot.data[index].title == null)
                   ? "no data"
                   : snapshot.data[index].title,
               newsname: (snapshot.data[index].name == null)
                   ? "no data"
                   : snapshot.data[index].name,
               newsTime: (snapshot.data[index].publishedAt == null)
                   ? "no data"
                   : snapshot.data[index].publishedAt,
             );
           }
           ):SkeletonListView(itemCount: 12, padding: EdgeInsets.all(20), scrollable: true,);


      },

      ),
            Visibility(
              visible: _moreBusiVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("more from business",style: TextStyle(fontWeight: FontWeight.w600),),ElevatedButton.icon(onPressed: (() {setState(() {
                      businessNum=4;

                      _moreBusiVisible = false;
                      _lessBusiVisible = true;
                    }); }), icon: SvgPicture.asset(vector), label:SizedBox.shrink(), style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: (Colors.white),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999) ),
                    ))],
                ),
              ),
            ),
            Visibility(
              visible: _lessBusiVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("less from business",style: TextStyle(fontWeight: FontWeight.w600),),ElevatedButton.icon(onPressed: (() {setState(() {
                      businessNum=2;
                      _moreBusiVisible = true;
                      _lessBusiVisible = false;
                    }); }), icon: SvgPicture.asset(vector), label:SizedBox.shrink(), style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: (Colors.white),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999) ),
                    ))],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sports", style: TextStyle(
                  fontSize: textFont26, fontWeight: FontWeight.w800),
                textAlign: TextAlign.left,),
            ),
            FutureBuilder(future: ApiController.fetchCategoryArticles("sports"),
              builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
                return (snapshot.hasData)?
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sportsNum,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                        newsImage: (snapshot.data[index].urlToImage==null )? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                            : snapshot.data[index].urlToImage
                        ,
                        newsText: (snapshot.data[index].title == null)
                            ? "no data"
                            : snapshot.data[index].title,
                        newsname: (snapshot.data[index].name == null)
                            ? "no data"
                            : snapshot.data[index].name,
                        newsTime: (snapshot.data[index].publishedAt == null)
                            ? "no data"
                            : snapshot.data[index].publishedAt,
                      );
                    }
                ):SkeletonListView(itemCount: 12, padding: EdgeInsets.all(20), scrollable: true,);


              },

            ),
            Visibility(
              visible: _moreSpoVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("more from Sports",style: TextStyle(fontWeight: FontWeight.w600),),ElevatedButton.icon(onPressed: (() {setState(() {
                      sportsNum=4;
                      _moreSpoVisible = false;
                      _lessSpoVisible = true;
                    }); }), icon: SvgPicture.asset(vector), label:SizedBox.shrink(), style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: (Colors.white),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999) ),
                    ))],
                ),
              ),
            ),
            Visibility(
              visible: _lessSpoVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("less from Sports",style: TextStyle(fontWeight: FontWeight.w600),),ElevatedButton.icon(onPressed: (() {setState(() {
                      sportsNum=2;
                      _moreSpoVisible = true;
                      _lessSpoVisible = false;
                    }); }), icon: SvgPicture.asset(vector), label:SizedBox.shrink(), style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: (Colors.white),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999) ),
                    ))],
                ),
              ),
            ),


          ],
        ),
      )




      ,
// return
);


    }
}

