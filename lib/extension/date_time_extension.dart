extension DateTimeExtension on DateTime {
  /// Retorna um valor `booleano` que indica se a data que você está comparando
  /// é a mesma data de hoje.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Retorna um valor `booleano`  que indica se a data que você está comparando
  /// é anterior a data de hoje.
  bool get isBeforeToday {
    final now = DateTime.now();
    return isBefore(now);
  }

  /// Retorna um valor `booleano`  que indica se a data que você está comparando
  /// é posterior a data de hoje.
  bool get isAfterToday {
    final now = DateTime.now();
    return isAfter(now);
  }

  /// Retorna um valor `String` formatado para o padrão brasileiro `dd/MM/yyyy`.
  String formatToBr() {
    List<String> daySelected = [];
    List<String> monthSelected = [];

    if (day.toString().length == 1) {
      daySelected.add('0$day');
    } else {
      daySelected.add(day.toString());
    }

    if (month.toString().length == 1) {
      monthSelected.add('0$month');
    } else {
      monthSelected.add(month.toString());
    }

    return '${daySelected[0]}/${monthSelected[0]}/$year';
  }

  /// Retorna um valor `String` formatado para o padrão brasileiro `dd/MM/yyyy HH:mm`.
  String formatToBrWithHour() {
    List<String> daySelected = [];
    List<String> monthSelected = [];
    List<String> hourSelected = [];
    List<String> minuteSelected = [];

    if (day.toString().length == 1) {
      daySelected.add('0$day');
    } else {
      daySelected.add(day.toString());
    }

    if (month.toString().length == 1) {
      monthSelected.add('0$month');
    } else {
      monthSelected.add(month.toString());
    }

    if (hour.toString().length == 1) {
      hourSelected.add('0$hour');
    } else {
      hourSelected.add(hour.toString());
    }

    if (minute.toString().length == 1) {
      minuteSelected.add('0$minute');
    } else {
      minuteSelected.add(minute.toString());
    }

    return '${daySelected[0]}/${monthSelected[0]}/$year ${hourSelected[0]}:${minuteSelected[0]}';
  }

  /// Retorna um valor `String` formatado para o padrão de banco de dados `yyyy-MM-dd`.
  String formatToBd() {
    List<String> daySelected = [];
    List<String> monthSelected = [];

    if (day.toString().length == 1) {
      daySelected.add('0$day');
    } else {
      daySelected.add(day.toString());
    }

    if (month.toString().length == 1) {
      monthSelected.add('0$month');
    } else {
      monthSelected.add(month.toString());
    }

    return '$year-${monthSelected[0]}-${daySelected[0]}';
  }

  /// Retorna um valor `String` formatado para o padrão de banco de dados `yyMMdd`.
  String formatToCode() {
    List<String> daySelected = [];
    List<String> monthSelected = [];

    if (day.toString().length == 1) {
      daySelected.add('0$day');
    } else {
      daySelected.add(day.toString());
    }

    if (month.toString().length == 1) {
      monthSelected.add('0$month');
    } else {
      monthSelected.add(month.toString());
    }

    return '${year.toString().substring(2)}${monthSelected[0]}${daySelected[0]}';
  }


  /// Retorna um valor `String` formatado para o padrão de banco de dados `yyyy-MM-dd HH:mm:ss`.
  String formatToBdWithHour() {
    List<String> daySelected = [];
    List<String> monthSelected = [];
    List<String> hourSelected = [];
    List<String> minuteSelected = [];
    List<String> secondSelected = [];

    if (day.toString().length == 1) {
      daySelected.add('0$day');
    } else {
      daySelected.add(day.toString());
    }

    if (month.toString().length == 1) {
      monthSelected.add('0$month');
    } else {
      monthSelected.add(month.toString());
    }

    if (hour.toString().length == 1) {
      hourSelected.add('0$hour');
    } else {
      hourSelected.add(hour.toString());
    }

    if (minute.toString().length == 1) {
      minuteSelected.add('0$minute');
    } else {
      minuteSelected.add(minute.toString());
    }

    if (second.toString().length == 1) {
      secondSelected.add('0$second');
    } else {
      secondSelected.add(second.toString());
    }

    return '$year-$month-$day ${hourSelected[0]}:${minuteSelected[0]}:${secondSelected[0]}';
  }
}
