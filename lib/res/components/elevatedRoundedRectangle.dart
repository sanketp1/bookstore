import 'package:bookstore/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ElevatedRoundedRectangle extends StatelessWidget {
  Widget child;
   ElevatedRoundedRectangle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.getScreenWidth(context),
      height: Utils.getScreenHeight(context) * 0.1,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 8,
                offset: Offset(2.0, 2.0))
          ]),

          child: child,
    );
  }
}
