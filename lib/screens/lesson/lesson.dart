import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class Lesson extends StatelessWidget {
  final String fileLink;
  const Lesson({super.key, required this.fileLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: SfPdfViewer.network(fileLink)));
  }
}
