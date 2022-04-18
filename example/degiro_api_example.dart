import 'package:degiro_api/degiro_api.dart';
import 'dart:io';

void main() {
  print('Press y to start the example ');
  final value = stdin.readLineSync();

  if (value == 'y') {
    libraryTest();
  }
}

Future<void> libraryTest() async {
  // Read credentials from file ignored in .gitignore
  List<String> lines = File('./example/credentials.txt').readAsLinesSync();
  if (lines.isEmpty) return;

  // final degiro = DegiroApi.fromCredentials(lines.first, lines.last);
  final degiro = DegiroApi.fromSession(lines.first);

  try {
    await degiro.login();

    print(degiro.sessionId);

    // List<PortfolioPosition> positions = await degiro.portfolioPositions();
    // List<Transaction> transactions = await degiro.transactions(fromDate: DateTime(2022, 4, 18));
    // List<ProductInfo> products = await degiro.searchProducts(searchText: 'nasdaq');
    List<CashMovement> movements = await degiro.cashMovements(
      fromDate: DateTime(2022, 02, 23),
      toDate: DateTime(2022, 02, 25),
      showDegiroMovements: true,
    );
    for (var e in movements) {
      print(e.description);
    }

    await degiro.logout();
    print('Logged out');
  } on DegiroApiError catch (e) {
    print(e.message);
  }
}
