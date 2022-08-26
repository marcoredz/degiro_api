import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:multiple_result/multiple_result.dart';

/// Main DegiroApi repository interface
abstract class IRepository {
  Future<Result<DegiroApiError, LoginResponse>> loginRequest(
    String username,
    String password,
  );

  Future<Result<DegiroApiError, AccountInfo>> getClientInfoRequest(
    String sessionId,
  );

  Future<Result<DegiroApiError, void>> logoutRequest(
    String sessionId,
    int intAccount,
  );

  Future<Result<DegiroApiError, List<dynamic>>> getPortfolioPositionsRequest(
    String sessionId,
    int intAccount,
  );

  Future<Result<DegiroApiError, List<ProductInfo>>> getProductsInfoRequest(
    String sessionId,
    int intAccount,
    List<String> productIds,
  );

  Future<Result<DegiroApiError, List<Transaction>>> getTransactionsRequest(
    String sessionId,
    int intAccount,
    DateTime fromDate,
    DateTime toDate,
    bool groupByOrder,
  );

  Future<Result<DegiroApiError, List<ProductInfo>>> searchProductsRequest(
    String sessionId,
    int intAccount,
    String searchText,
    int limit,
    int offset,
    int productType, [
    String? sortColumn,
    String? sortType,
  ]);

  Future<Result<DegiroApiError, List<CashMovement>>> getCashMovementsRequest(
    String sessionId,
    int intAccount,
    DateTime fromDate,
    DateTime toDate,
  );
}
