extension DateTimeFormatting on DateTime {
  // Format DateTime as ISO 8601
  String toIso8601() {
    return toIso8601String();
  }

  // Format DateTime as Short Date: MM/DD/YYYY
  String toShortDate() {
    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/$year}';
  }

  // Format DateTime as Long Date: Month DD, YYYY
  String toLongDate() {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${monthNames[month - 1]} ${day}, ${year}';
  }

  // Format DateTime as 24-Hour Time: HH:MM:SS
  String to24HourTime() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
  }

  // Format DateTime as 12-Hour Time with AM/PM: hh:MM:SS AM/PM
  String to12HourTime() {
    String period = this.hour < 12 ? 'AM' : 'PM';
    int hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} $period';
  }

  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  DateTime addMonths(int months) {
    return DateTime(year, month + months, day, hour, minute, second,
        millisecond, microsecond);
  }

  DateTime subtractMonths(int months) {
    return DateTime(year, month - months, day, hour, minute, second,
        millisecond, microsecond);
  }

  DateTime addYears(int years) {
    return DateTime(year + years, month, day, hour, minute, second, millisecond,
        microsecond);
  }

  DateTime subtractYears(int years) {
    return DateTime(year - years, month, day, hour, minute, second, millisecond,
        microsecond);
  }

  DateTime addSeconds(int seconds) {
    return add(Duration(seconds: seconds));
  }

  DateTime subtractSeconds(int seconds) {
    return subtract(Duration(seconds: seconds));
  }

  DateTime addMilliseconds(int milliseconds) {
    return add(Duration(milliseconds: milliseconds));
  }

  DateTime subtractMilliseconds(int milliseconds) {
    return subtract(Duration(milliseconds: milliseconds));
  }

  DateTime addHours(int hours) {
    return add(Duration(hours: hours));
  }

  DateTime subtractHours(int hours) {
    return subtract(Duration(hours: hours));
  }

  DateTime addMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }

  DateTime subtractMinutes(int minutes) {
    return subtract(Duration(minutes: minutes));
  }

  int weeksInMonth() {
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
    int daysInMonth = lastDayOfMonth.day;

    int daysRemaining = daysInMonth - firstDayOfMonth.weekday + 1;
    int weeks = (daysRemaining / 7).ceil();

    return weeks;
  }

  DateTime addWeekdays(int daysToAdd) {
    DateTime result = this;

    while (daysToAdd > 0) {
      result = result.add(Duration(days: 1));
      if (result.weekday == DateTime.saturday ||
          result.weekday == DateTime.sunday) {
        continue; // Skip weekends
      }
      daysToAdd--;
    }

    return result;
  }

  int get calculateAge {
    final today = DateTime.now();
    int age = today.year - year;

    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    return age;
  }
}
