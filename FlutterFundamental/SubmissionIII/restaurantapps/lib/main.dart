import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurantapps/model/restaurant.dart';
import 'package:restaurantapps/model/restaurant_search.dart';
import 'package:restaurantapps/model/favorite.dart';
import 'package:restaurantapps/ui/card/card_favorite.dart';
import 'package:restaurantapps/ui/detail/restaurant_detail_fav.dart';
import 'package:restaurantapps/ui/home_page.dart';
import 'package:restaurantapps/ui/detail/restaurant_detail.dart';
import 'package:restaurantapps/ui/detail/restaurant_detail_search.dart';
import 'package:restaurantapps/ui/settings_page.dart';
import 'package:restaurantapps/widget/bottom_navbar.dart';
import 'db/background_services.dart';
import 'widget/navigation.dart';
import 'db/notification_helper.dart';
import 'ui/restaurant_search.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
        RestaurantDetailSearchPage.routeName: (context) => RestaurantDetailSearchPage(
              restaurant: ModalRoute.of(context)?.settings.arguments as RestaurantSearch,
            ),
        RestaurantDetailFav.routeName: (context) => RestaurantDetailFav(
          favorite:
          ModalRoute.of(context)?.settings.arguments as Favorite,
        ),
        CardFavorite.routeName: (context) => CardFavorite(),
        SettingsPage.routeName: (context) => SettingsPage(),
      },
    );
  }
}
