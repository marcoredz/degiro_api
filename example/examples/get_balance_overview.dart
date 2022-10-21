import 'dart:io';

import 'package:degiro_api/degiro_api.dart';

import '../console_color_extension.dart';

void main() {
  print('Press y to start the example ');
  final value = stdin.readLineSync();

  if (value == 'y') {
    libraryTest();
  }
}

Future<void> libraryTest() async {
  // Read credentials from file
  List<String> lines = File('./example/credentials.txt').readAsLinesSync();
  if (lines.isEmpty) return;

  // final degiro = DegiroApi.fromCredentials(lines.first, lines.last);
  final degiro = DegiroApi.fromSession(lines.first);

  try {
    await degiro.login();

    print(degiro.sessionId);

    final List<PortfolioPosition> positions = await degiro.portfolioPositions();

    for (var e in positions.where(
      (p) => p.productInfo!.name.contains('iShares'),
    )) {
      print('''
  ${e.productInfo!.name.yellow}
  ${'Today realized P/L'.blue} ${e.todayRealizedProductPl}
  ${'Realized P/L:'.blue} ${e.realizedProductPl}
  ${'Yesterday value:'.blue} ${e.value} ${'Price:'.blue} ${e.price} ${'Close price'.blue} ${e.productInfo!.closePrice}
  ${'P/L base:'.blue} ${e.plBase} ${'Today P/L base:'.blue} ${e.todayPlBase}
  ${'Latest value:'.blue} ${e.latestValue}
  ${'Today P/L:'.blue} ${e.todayPl}
  ${'Total P/L:'.blue} ${e.totalPl}
  ${'Unrealized P/L:'.blue} ${e.unrealizedPl}
      ''');
    }

    // await degiro.logout();
  } on DegiroApiError catch (e) {
    print(e.message);
  }
}
