import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapps/api/api_search.dart';
import 'package:restaurantapps/provider/search_provider.dart';
import 'package:restaurantapps/ui/card/card_search.dart';
import 'package:restaurantapps/widget/platforms_widget.dart';

class RestaurantSearchPage extends StatelessWidget {
  static const routeName = '/resto_search';

  final String nameRestaurant;
  const RestaurantSearchPage({required this.nameRestaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SearchProvider>(
        create: (_) => SearchProvider(
            apiSearch: ApiSearch(query: nameRestaurant)),
        child: RestaurantSearchList(),
      ),
    );
  }
}

class RestaurantSearchList extends StatelessWidget {
  TextEditingController searchController = new TextEditingController();
  String namaRestaurant = 'namaRestaurant';
  Widget _buildList() {
    TextEditingController searchController = TextEditingController();
    return Consumer<SearchProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Container(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: 1,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: 1,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.result.restaurants.length,
                              itemBuilder: (context, index) {
                                var restaurant = state.result.restaurants[index];
                                return CardSearch(restaurant: restaurant);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]));
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
      appBar: AppBar(
        title: Text('Resto App'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Resto App'),
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
