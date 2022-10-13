## 0.0.1
- Initial version, features: 
    - login
    - logout
    - portfolio positions

## 0.2.0
- New features added:
    - transactions
    - search products
    - account cash movements

### 0.2.1
- Fixes to pass static analysis

## 0.3.0
- New 'isLoggedIn' getter to know if the user has logged in
- Rework of the 'instance' getter to make it really null safety

### 0.3.1
- Update APIs documentation
- Fix CHANGELOG file
- Rename 'showDegiroMovements' parameter of 'cashMovements' method in 'showFlatexMovements'

## 0.4.0
- New 'isOpen' getter for PortfolioPosition class: <br>
_true_ if the portfolio position is currently open on the market otherwise _false_
- New 'includeCash' named parameter for portfolioPosition method: <br>
if _true_, the method adds the account cash position to the result. _false_ as default.
- Internal code improvements and update documentation

### 0.4.1
- Change license from Apache 2 to MIT
