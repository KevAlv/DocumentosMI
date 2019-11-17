import 'package:flutter/material.dart';
import 'package:ml_kit/common/session_global.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final String nameImage;
  const ImageView({Key key, @required this.nameImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider: NetworkImage(URL_HOST + 'uploads/' + nameImage),
    ));
  }
}
