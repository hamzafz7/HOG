import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class FileViewWidget extends StatefulWidget {
  final String imagePath;

  const FileViewWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<FileViewWidget> createState() => _FileViewWidgetState();
}

class _FileViewWidgetState extends State<FileViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PDF(
        swipeHorizontal: false,
      ).cachedFromUrl(
        widget.imagePath,
        placeholder: (progress) => Center(
            child: Text(
          '$progress %',
        )),
        errorWidget: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
      // body: WebViewWidget(controller: controller),
    );
  }
}
