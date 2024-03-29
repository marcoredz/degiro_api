import 'dart:io';

import 'package:degiro_api/degiro_api.dart';

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

  final degiro = DegiroApi.fromCredentials(lines.first, lines.last);
  // final degiro = DegiroApi.fromSession(lines.first);

  try {
    await degiro.login();
    print(DegiroApi.instance.isLoggedIn ? 'yes' : 'no');

    print(degiro.sessionId);

    List<Transaction> transactions =
        await degiro.transactions(fromDate: DateTime(2022, 4, 18));

    List<ProductInfo> products = await degiro.searchProducts(
      searchText: 'nasdaq',
      sortColumn: 'name',
      sortType: 'asc',
      limit: 10,
      offset: 10 * 2,
    );

    List<CashMovement> movements = await degiro.cashMovements(
      fromDate: DateTime(2022, 02, 23),
      toDate: DateTime(2022, 02, 25),
      showFlatexMovements: true,
    );

    await degiro.logout();
    print(DegiroApi.instance.isLoggedIn ? 'yes' : 'no');
  } on DegiroApiError catch (e) {
    print(e.message);
  }
}
