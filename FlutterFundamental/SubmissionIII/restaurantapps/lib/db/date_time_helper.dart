import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    // Date and Time Format
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    final timeSpecific = "15:21:30";
    final completeFormat = DateFormat('y/M/d H:m:s');

    // Today Format
    final todayDate = dateFormat.format(now);
    print(todayDate);
    final todayDateAndTime = "$todayDate $timeSpecific";
    var resultToday = completeFormat.parseStrict(todayDateAndTime);
    print(resultToday);

    // Tomorrow Format
    var formatted = resultToday.add(Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $timeSpecific";
    var resultTomorrow = completeFormat.parseStrict(tomorrowDateAndTime);

    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}