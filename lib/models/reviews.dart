import 'package:lettutor/models/review.dart';

class Reviews {
  int count;
  List<Review> rows = [];

  Reviews.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        rows = json['rows']
            .map<Review>((review) => Review.fromJson(review))
            .toList();
}
