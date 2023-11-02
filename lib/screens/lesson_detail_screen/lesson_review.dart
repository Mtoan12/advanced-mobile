import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class LessonReviewWidget extends StatelessWidget {
  final String lessonUrl;
  const LessonReviewWidget({super.key, required this.lessonUrl});

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: lessonUrl,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
    );
  }
}
