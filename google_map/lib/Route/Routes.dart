// ignore: file_names, unused_import
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_map/Route/RoutesName.dart';
import 'package:google_map/View_/home_view.dart';
import 'package:google_map/View_/Map_view.dart';

class Routes {
  static Route<dynamic> generate_Route(RouteSettings Maps) {
    switch (Maps.name) {
      case Routesname.home:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeView(),
          );
        }

      case Routesname.map:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => MapView(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(body: Center(child: Text('No Route Found'))),
          );
        }
    }
  }
}
