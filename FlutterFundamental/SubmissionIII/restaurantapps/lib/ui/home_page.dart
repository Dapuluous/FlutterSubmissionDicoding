import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapps/api/api_restaurant_list.dart';
import 'package:restaurantapps/provider/restaurant_provider.dart';
import 'package:restaurantapps/ui/restaurant_search.dart';
import 'package:restaurantapps/ui/card/card_restaurant.dart';
import 'package:restaurantapps/widget/platforms_widget.dart';

class Home extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ListProvider>(
        create: (_) => ListProvider(apiRestaurantList: ApiRestaurantList()),
        child: DataRestaurant(),
      ),
    );
  }
}

class DataRestaurant extends StatefulWidget {
  @override
  State<DataRestaurant> createState() => _DataRestaurantState();
}

class _DataRestaurantState extends State<DataRestaurant> {
  TextEditingController searchController = new TextEditingController();
  String namaRestaurant = 'namaRestaurant';

  Widget _buildList() {
    return Consumer<ListProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Scaffold (
              appBar: AppBar(
                title: Text("Restaurant Apps"),
              ),
              body: Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) {
                                    namaRestaurant = searchController.text;
                                    Navigator.pushNamed(
                                      context,
                                      RestaurantSearchPage.routeName,
                                      arguments: namaRestaurant,
                                    );
                                  },
                                  controller: searchController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Cari Restoran Favoritmu',
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {
                                        namaRestaurant = searchController.text;
                                        Navigator.pushNamed(
                                          context,
                                          RestaurantSearchPage.routeName,
                                          arguments: namaRestaurant,
                                        );
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.result.restaurants.length,
                                    itemBuilder: (context, index) {
                                      var restaurant = state.result.restaurants[index];
                                      return CardRestaurant(restaurant: restaurant);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                  )
              ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Restaurant Apps'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
