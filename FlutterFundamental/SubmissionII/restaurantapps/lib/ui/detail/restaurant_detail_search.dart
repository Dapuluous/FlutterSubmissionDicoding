import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapps/api/api_search_detail.dart';
import 'package:restaurantapps/model/restaurant_search.dart';
import 'package:restaurantapps/provider/search_detail_provider.dart';

class RestaurantDetailSearchPage extends StatelessWidget {
  static const routeName = '/search_resto_detail';

  final RestaurantSearch restaurant;
  const RestaurantDetailSearchPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SearchDetailProvider>(
        create: (_) => SearchDetailProvider(
            apiSearchDetail:
            ApiSearchDetail(idDetail: restaurant.id)),
        child: DetailMenu(),
      ),
    );
  }
}

class DetailMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: "Detail Restoran",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tray_fill),
            label: 'Makanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.drop_fill),
            label: 'Minuman',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pencil_circle_fill),
            label: 'Review',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return DetailPage();
          case 1:
            return FoodsPage();
          case 2:
            return DrinksPage();
          case 3:
            return ReviewsPage();
          default:
            return const Center(
              child: Text('Page not found!'),
            );
        }
      },
    );
  }
}

class FoodsPage extends StatefulWidget {
  @override
  _FoodsPageState createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var restaurantDetail = state.result.restaurant;

          return Scaffold(
              appBar: AppBar(
                title: Text("Daftar Makanan"),
              ),
              body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                      restaurantDetail.menus.foods.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(bottom: 10.0),
                                              child: Ink(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black12,
                                                        width: 2.0),
                                                    color: Colors.white30,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(restaurantDetail
                                                        .menus.foods[index].name),
                                                  )),
                                            ));
                                      }),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )));
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
}

class DrinksPage extends StatefulWidget {
  @override
  _DrinksPageState createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var restaurantDetail = state.result.restaurant;

          return Scaffold(
              appBar: AppBar(
                title: Text("Daftar Minuman"),
              ),
              body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                      restaurantDetail.menus.drinks.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(bottom: 10.0),
                                              child: Ink(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black12,
                                                        width: 2.0),
                                                    color: Colors.white30,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(restaurantDetail
                                                        .menus.drinks[index].name),
                                                  )),
                                            ));
                                      }),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )));
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
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var restaurantDetail = state.result.restaurant;

          return Scaffold(
              appBar: AppBar(
                title: Text(restaurantDetail.name),
              ),
              body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            'https://restaurant-api.dicoding.dev/images/medium/' +
                                restaurantDetail.pictureId),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(restaurantDetail.name,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 20,
                                          ),
                                          Text(
                                            restaurantDetail.rating.toString(),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text(
                                      "${restaurantDetail.address}, ${restaurantDetail.city}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: const Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text('Deskripsi: ',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  restaurantDetail.description,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )));
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
}

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var restaurantDetail = state.result.restaurant;

          return Scaffold(
              appBar: AppBar(
                title: Text("Review Tempat"),
              ),
              body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount:
                                      restaurantDetail.customerReviews.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Card(
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black12,
                                                      width: 1.0
                                                  ),
                                                  color: Colors.white30,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                          'Name: ${restaurantDetail.customerReviews[index].name}'
                                                      ),
                                                      Text(
                                                          'Date: ${restaurantDetail.customerReviews[index].date}'
                                                      ),
                                                      Text(
                                                          'Review: ${restaurantDetail.customerReviews[index].review}'
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )));
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
}
