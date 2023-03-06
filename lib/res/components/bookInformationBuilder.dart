// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BookInformationBuilder extends StatelessWidget {
  String tag;
  String data;
  BookInformationBuilder({
    Key? key,
    required this.tag,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Text(
          "$tag : ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        title: Text(
          data,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
