import 'package:flutter/material.dart';
import 'package:news/constants.dart';


class Fristcard extends StatelessWidget {
  var ImageFrist;
  var TextFrist;
  var currentDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(image: NetworkImage(ImageFrist),
            fit: BoxFit.cover,
            height: 200,
            width: 400,
          ),
        ),
        Positioned(
          left: 15,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${TextFrist}',
                style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${currentDate} ',
                style: TextStyle(
                    color: white,
                    fontSize: 12
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Fristcard({
    required this.ImageFrist,
    required this.TextFrist,
    required this.currentDate,
  });
}
