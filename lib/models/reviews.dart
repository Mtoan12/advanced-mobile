import 'package:lettutor/models/review.dart';

class Reviews {
  int count;
  List<Review> rows;

  Reviews({this.count = 0, this.rows = const []});

  Reviews.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        rows = json['rows'].map((review) => Review.fromJson(review)).toList();
}
