import 'package:restaurantapps/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurant restaurants;
  const DetailRestaurant({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news),
            title: Text('Detail Restoran'),
          ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tray_fill),
              title: Text('Makanan'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.drop_fill),
              title: Text('Minuman'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return DetailPage(restaurants: restaurants);
            case 1:
              return FoodsPage(restaurants: restaurants);
            case 2:
              return DrinksPage(restaurants: restaurants);
            default:
              return const Center(
                child: Text('Page not found!'),
              );
          }
        },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Restaurant restaurants;
  const DetailPage({Key? key, required this.restaurants}) : super(key: key);
  static const tag = 'detail_restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurants.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                ),
              ),
              child: Image.network(restaurants.pictureId),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurants.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        restaurants.city,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    restaurants.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodsPage extends StatelessWidget {
  final Restaurant restaurants;
  const FoodsPage({Key? key, required this.restaurants}) : super(key: key);
  static const tag = 'detail_restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Makanan"),
      ),
      body: SingleChildScrollView (
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: restaurants.menus.foods.map((food) {
                return Container (
                  padding: const EdgeInsets.only(left:10, right:10, top: 5),
                  child: Card (
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(food.name),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinksPage extends StatelessWidget {
  final Restaurant restaurants;
  const DrinksPage({Key? key, required this.restaurants}) : super(key: key);
  static const tag = 'detail_restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Minuman"),
      ),
      body: SingleChildScrollView (
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: restaurants.menus.drinks.map((drink) {
                return Container (
                  padding: const EdgeInsets.only(left:10, right:10, top: 5),
                  child: Card (
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(drink.name),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}