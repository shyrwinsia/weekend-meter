class WeekendUtility {
  static DateTime getNextMidnight() {
    DateTime dateTime = DateTime.now();

    while (dateTime.second != 0) {
      dateTime = dateTime.add(Duration(seconds: 1));
    }
    while (dateTime.minute != 0) {
      dateTime = dateTime.add(Duration(minutes: 1));
    }
    while (dateTime.hour != 0) {
      dateTime = dateTime.add(Duration(hours: 1));
    }
    while (dateTime.weekday != 1) {
      dateTime = dateTime.add(Duration(days: 1));
    }
    return dateTime;
  }

  // my weekend starts at 7pm on friday :)
  static bool isItWeekendAlready() {
    DateTime now = DateTime.now();
    return (now.weekday == DateTime.friday && now.hour >= 19) ||
        now.weekday == DateTime.saturday ||
        now.weekday == DateTime.sunday;
  }
}
