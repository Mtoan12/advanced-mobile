import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor/json/reviews.dart';
import 'package:lettutor/models/review.dart';

class ReviewProvider extends ChangeNotifier {
  List<Review> reviews = [];

  ReviewProvider() {
    var list = json.decode(reviewsJson) as List<dynamic>;
    reviews = list.map((review) => Review.fromJson(review)).toList();
  }
}
