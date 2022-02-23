import 'package:flutter/material.dart';
import 'package:restaurantapps/model/restaurant.dart';
import 'package:restaurantapps/model/restaurant_search.dart';
import 'package:restaurantapps/ui/home_page.dart';
import 'package:restaurantapps/ui/detail/restaurant_detail.dart';
import 'package:restaurantapps/ui/detail/restaurant_detail_search.dart';
import 'package:restaurantapps/widget/bottom_navbar.dart';
import 'ui/restaurant_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Apps',
      initialRoute: BottomNavbar.routeName,
      routes: {
        BottomNavbar.routeName: (context) => BottomNavbar(),
        Home.routeName: (context) => Home(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
          restaurant:
          ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
        RestaurantSearchPage.routeName: (context) => RestaurantSearchPage(
          nameRestaurant:
          ModalRoute.of(context)?.settings.arguments as String,
        ),
        RestaurantDetailSearchPage.routeName: (context) =>
            RestaurantDetailSearchPage(
              restaurant: ModalRoute.of(context)?.settings.arguments as RestaurantSearch,
            ),
      },
    );
  }
}
