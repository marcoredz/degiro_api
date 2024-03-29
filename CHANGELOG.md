## 0.6.4
Update latest dependencies
### 0.6.3
Update 'dio' dependency version to 5.0.3
### 0.6.2
Update 'multiple_result' dependency version to 4.0.0
### 0.6.1
Additional check of the sessionId validity during login
### 0.6.0
- Add new properties to `PortfolioPosition` model:
    - `plBase`
    - `todayPlBase`
    - `latestValue`
    - `todayPl`
    - `totalPl`
    - `unrealizedPl`

- Improve `PortfolioPosition` documentation.
- Added new example './example/examples/get_balance_overview.dart'.


## 0.5.2
### 0.5.2
- Bugfix during portfolio positions processing for fields:
    - `breakEvenPrice`
    - `realizedProductPl`
    - `todayRealizedProductPl`
- Update .gitignore

### 0.5.1
- Internal fixes: auto generated files implementation

### 0.5.0
- Add 'freezed' package as model handler: <br>
DegiroApi models now have `fromJson` and `toJson` methods.

## 0.4.1
### 0.4.1
- Change license from Apache 2 to MIT

### 0.4.0
- New `isOpen` getter for PortfolioPosition class: <br>
_true_ if the portfolio position is currently open on the market otherwise _false_
- New `includeCash` named parameter for portfolioPosition method: <br>
if _true_, the method adds the account cash position to the result. _false_ as default.
- Internal code improvements and update documentation

## 0.3.1
### 0.3.1
- Update APIs documentation
- Fix CHANGELOG file
- Rename 'showDegiroMovements' parameter of 'cashMovements' method in 'showFlatexMovements'

### 0.3.0
- New `isLoggedIn` getter to know if the user has logged in
- Rework of the `instance` getter to make it really null safety

## 0.2.1
### 0.2.1
- Fixes to pass static analysis

### 0.2.0
- New features added:
    - transactions
    - search products
    - account cash movements

## 0.0.1
- Initial version, features: 
    - login
    - logout
    - portfolio positions