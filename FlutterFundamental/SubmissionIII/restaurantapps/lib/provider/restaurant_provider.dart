import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantapps/api/api_restaurant_list.dart';
import 'package:restaurantapps/model/restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class ListProvider extends ChangeNotifier {
  final ApiRestaurantList apiRestaurantList;

  ListProvider({required this.apiRestaurantList}) {
    _fetchAllRestaurant();
  }

  late Welcome _welcome;
  late ResultState _state;

  String _message = '';
  String get message => _message;
  Welcome get result => _welcome;
  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiRestaurantList.topHeadlines();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Hasil pencarian tidak ditemukan.';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _welcome = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message =
      'Terjadi kesalahan, silahkan cek koneksi internet anda.';
    }
  }
}
