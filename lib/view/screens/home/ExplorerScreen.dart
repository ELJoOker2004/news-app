import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/controller/apicontroller.dart';
import 'package:news/view/component/NewsCard.dart';
import 'package:news/view/component/button.dart';
import 'package:news/view/component/maincard.dart';
import 'package:skeletons/skeletons.dart';





class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  var x = "general";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "General",
                            textColor: x == "general" ? white : mainColor,
                            backgroundColor: x == "general" ? mainColor : white,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "general";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Health",
                            textColor: x == "health" ? white : mainColor,
                            backgroundColor: x == "health" ? mainColor : white,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "health";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "sports",
                            textColor: x == "sports" ? white : mainColor,
                            backgroundColor: x == "sports" ? mainColor : white,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "sports";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: ("Entertain"),
                          textColor: x == "entertainment" ? white : mainColor,
                          backgroundColor: x == "entertainment" ? mainColor : white,
                            borderColor: mainColor,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          x = "entertainment";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Science",
                            textColor: x == "science" ? white : mainColor,
                            backgroundColor: x == "science" ? mainColor : white,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "science";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Business",
                            textColor: x == "business" ? white : mainColor,
                            backgroundColor: x == "business" ? mainColor : white,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "business";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Technology",
                            textColor: x == "technology" ? white : mainColor,
                            backgroundColor: x == "technology" ? mainColor : white,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "technology";
                        });
                        // x=RestApiController.fetchCategoryArticles();
                      },
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: ApiController.fetchCategoryArticles("$x"),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (index == 0)
                          ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Fristcard(
                          ImageFrist: (snapshot
                              .data[index].urlToImage ==
                              null)
                              ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                              : snapshot.data[index].urlToImage,
                          TextFrist:
                          (snapshot.data[index].title == null)
                              ? "no have data"
                              : snapshot.data[index].title,
                          currentDate: (snapshot
                              .data[index].publishedAt ==
                              null)
                              ? "no data"
                              : snapshot.data[index].publishedAt,
                        ),
                      )
                          : NewsCard(
                        newsImage: (snapshot
                            .data[index].urlToImage ==
                            null)
                            ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                            : snapshot.data[index].urlToImage,
                        newsText:
                        (snapshot.data[index].title == null)
                            ? "no data"
                            : snapshot.data[index].title,
                        newsname:
                        (snapshot.data[index].name == null)
                            ? "no data"
                            : snapshot.data[index].name,
                        newsTime:
                        (snapshot.data[index].publishedAt ==
                            null)
                            ? "no data"
                            : snapshot.data[index].publishedAt,
                      );
                    },
                  )
                       :SkeletonListView(itemCount: 12, padding: EdgeInsets.all(20), scrollable: true,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
