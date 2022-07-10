A Dart wrapper to provide in a simply way Degiro APIs.

Since it is just a wrapper, consider these APIs unofficial.

**NOTE**: this package doesn't allow to perform any type of order creation in your account due to Degiro's current restrictions about their API usage.

## Usage
```dart
// Create the DegiroApi instance
final degiro = DegiroApi.fromCredentials('username', 'password');

try {
    // Logins with credentials provided and creates the session
    await degiro.login();

    // Gets the account info (login method returns this property)
    final accountInfo = degiro.accountInfo;

    // Gets the account current portfolio positions
    final List<PortfolioPosition> positions = await degiro.portfolioPositions();

    // Show the positions name list
    for (var p in positions) {
      print(p.productInfo?.name);
    }

    // Logout from the session
    await degiro.logout();
} on DegiroApiError catch (e) {
    print(e.message);
}
```

## Available methods

### Constructors

- DegiroApi.fromCredentials(String username, String password)

  creates the degiro instance based on the username & password. **NOTE**: 2FA is in roadmap
- DegiroApi.fromSession(String sessionId)
  
  creates the degiro instance based on the jsessionid. It can be taken from the browser dev tool accessing network request. Every request to a Degiro API must contain a sessionId to be perfomed.

### Methods

- login
- logout
- portfolioPositions
- productInfo
- productInfos
- transactions
- searchProducts
- cashMovements

## Contributing

Since this package is maintained by one person, help is appreciated so feel free to open issues & pull requests on GitHub repository.
