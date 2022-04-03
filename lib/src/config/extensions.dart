extension DateFormat on DateTime {
  String toDegiroFormat() =>
      "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}";
}
