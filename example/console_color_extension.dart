extension ConsoleColor on String {
  String get yellow => '\x1b[33m$this\x1b[0m';
  String get blue => '\x1b[34m$this\x1b[0m';
}
