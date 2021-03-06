import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurantapps/db/date_time_helper.dart';
import '../db/background_services.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;
  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;

    if (_isScheduled == true) {
      print('Scheduling News Activated');
      print(_isScheduled);
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24), 1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling News Canceled');
      print(_isScheduled);
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}