import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantapps/api/api_search_detail.dart';
import 'package:restaurantapps/model/restaurant_search_detail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class SearchDetailProvider extends ChangeNotifier {
  final ApiSearchDetail apiSearchDetail;

  SearchDetailProvider({required this.apiSearchDetail}) {
    _fetchDetailRestaurant();
  }

  late DetailSearch _detailSearch;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailSearch get result => _detailSearch;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiSearchDetail.topDetaillines();
      if (restaurant.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Hasil pencarian tidak ditemukan.';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailSearch = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message =
      'Terjadi kesalahan, silahkan cek koneksi internet anda.';
    }
  }
}
