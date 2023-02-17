import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/controller/apicontroller.dart';
import 'package:news/view/component/NewsCard.dart';
import 'package:news/view/component/maincard.dart';
import 'package:skeletons/skeletons.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Bookmarks",
          style: TextStyle(
              color: black, fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: ApiController.fetchCategoryArticles("general"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return (index == 0)
                  ? Fristcard(
                ImageFrist: '${snapshot.data[index].urlToImage}',
                TextFrist: '${snapshot.data[index].title}',
                currentDate: "${snapshot.data[index].publishedAt}",
              )
                  : NewsCard(
                newsImage: (snapshot.data[index].urlToImage == null)
                    ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                    : snapshot.data[index].urlToImage,
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
            },
          )
               :SkeletonListView(itemCount: 12, padding: EdgeInsets.all(20), scrollable: true,);
        },
      ),
    );
  }
}
