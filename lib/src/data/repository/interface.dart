import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:multiple_result/multiple_result.dart';

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
}
