import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:multiple_result/multiple_result.dart';

/// Main DegiroApi repository interface
abstract class IRepository {
  Future<Result<LoginResponse, DegiroApiError>> loginRequest(
    String username,
    String password,
  );

  Future<Result<AccountInfo, DegiroApiError>> getClientInfoRequest(
    String sessionId,
  );

  Future<Result<void, DegiroApiError>> logoutRequest(
    String sessionId,
    int intAccount,
  );

  Future<Result<List<dynamic>, DegiroApiError>> getPortfolioPositionsRequest(
    String sessionId,
    int intAccount,
  );

  Future<Result<List<ProductInfo>, DegiroApiError>> getProductsInfoRequest(
    String sessionId,
    int intAccount,
    List<String> productIds,
  );

  Future<Result<List<Transaction>, DegiroApiError>> getTransactionsRequest(
    String sessionId,
    int intAccount,
    DateTime fromDate,
    DateTime toDate,
    bool groupByOrder,
  );

  Future<Result<List<ProductInfo>, DegiroApiError>> searchProductsRequest(
    String sessionId,
    int intAccount,
    String searchText,
    int limit,
    int offset,
    int productType, [
    String? sortColumn,
    String? sortType,
  ]);

  Future<Result<List<CashMovement>, DegiroApiError>> getCashMovementsRequest(
    String sessionId,
    int intAccount,
    DateTime fromDate,
    DateTime toDate,
  );

  Future<Result<void, DegiroApiError>> getAccountInfoRequest(
    String sessionId,
    int intAccount,
  );
}
