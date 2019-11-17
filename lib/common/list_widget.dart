import 'package:flutter/material.dart';
import 'package:ml_kit/common/session_global.dart';
import 'package:ml_kit/model/Fojas.dart';
import 'package:ml_kit/pages/image_view_page.dart';

Widget listCardBuilder(List<Foja> fojasSelected) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: fojasSelected.length,
    itemBuilder: (BuildContext context, int index) {
      return new GestureDetector(
        onTap: () {
          _selectImage(fojasSelected.elementAt(index).image, context);
        },
        child: Card(
          child: Image(
            image: NetworkImage(
                URL_HOST + 'uploads/' + fojasSelected.elementAt(index).image),
          ),
        ),
      );
    },
  );
}

_selectImage(String image, BuildContext context) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => ImageView(
                nameImage: image,
              )));
}
