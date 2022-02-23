import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantapps/api/api_restaurant_detail.dart';
import 'package:restaurantapps/model/restaurant_detail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiDetail apiDetail;

  DetailRestaurantProvider({required this.apiDetail}) {
    _fetchDetailRestaurant();
  }

  late Detail _detail;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  Detail get result => _detail;
  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiDetail.topDetaillines();
      if (restaurant.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Hasil pencarian tidak ditemukan.';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detail = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message =
      'Terjadi kesalahan, silahkan cek koneksi internet anda.';
    }
  }
}
