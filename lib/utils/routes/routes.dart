import 'package:bookstore/utils/routes/route_names.dart';
import 'package:bookstore/view/book_info_screen.dart';
import 'package:flutter/material.dart';

import '../../view/home_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.book_info:
        return MaterialPageRoute(
            builder: (BuildContext context) => BookInfoScreen());

       default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
