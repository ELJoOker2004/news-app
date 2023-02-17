import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/constants.dart';
class NewsCard extends StatelessWidget {
  String newsImage;
  String newsText;
  String newsname;
  String newsTime;

  @override
  Widget build(BuildContext context) {
    return Container(


child: Card(

elevation: 0,
color: white,
child: Row(
children: [Expanded(
    flex: 3,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8 ),
        child: ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.network(
          (newsImage == null) ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png" :
          "$newsImage",

          height: MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width/10,
        ),
),
      ),
    )),
  SizedBox(width: 10,),
  Expanded(flex: 5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(right:3),
                   child: SvgPicture.asset("assets/icons/Source Logo.svg",color: Colors.red,),
                 ),
                 Text(
                  (newsname == null) ? "no data" : "$newsname",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
            ),
               ],
             ),

          Text(
            (newsText == null) ? "no data" :  "$newsText",
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,

            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              (newsTime == null) ? "no data" :  "$newsTime",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Subtext),
            ),
          ),

        ],
  ))
  ],
),
),
);




  }

  NewsCard({
    required this.newsImage,
    required this.newsText,
    required this.newsname,
    required this.newsTime,
  });
}
