import 'package:ecommerse/utils/helper_function.dart';
import 'package:flutter/material.dart';

class RatingBarWidget extends StatefulWidget {
  @override
  _RatingBar createState() =>  _RatingBar();
}

class _RatingBar extends State<RatingBarWidget> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return  StarRating(
      rating: rating,
      onRatingChanged: (rating) => setState(() => this.rating = rating), color: const Color.fromARGB(255, 165, 149, 58),
    );
  }
}

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({super.key, this.starCount = 5, this.rating = 0, required this.onRatingChanged, required this.color});

  Widget buildStar(BuildContext context, int index) {
    Size size=responseMediaQuery(context);
    Icon icon;
    if (index >= rating) {
      icon =  Icon(
        Icons.star_border,
        color: Colors.black,
        size: size.width*0.03,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon =  Icon(
        Icons.star_half,
        color: color,
        size: size.width*0.03,
      );
    } else {
      icon =  Icon(
        Icons.star,
        color: color,
        size: size.width*0.03,
      );
    }
    return  InkResponse(
      // ignore: unnecessary_null_comparison
      //onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Row(children:  List.generate(starCount, (index) => buildStar(context, index)));
  }
}