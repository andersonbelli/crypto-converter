# crypto_converter

## Crypto currency converter

1. Design Requirements
   - Architecture BLoC + Clean
   - Networking 3rd party dependencies allowed
   - JSON 3rd party dependencies allowed
   - UI Material
   - Programming Language Flutter/Dart
   - API specification https://www.coingecko.com/api/documentations/v3
2. Functional requirement
   - The app helps to get the current price of any cryptocurrencies in any other supported
   - currencies that you need. User must be able to choose below items:
      - a) Crypto currency
         - List of crypto currencies can be pulled by using ```/coins/list```
      - b) National currency
         - List of supported national currencies can be pulled by using
           ```/simple/supported_vs_currencies```
   - Once user chooses a & b from above, below details are required to be shown to user.

| Details Required |
| ------ |
| Price |
| Market cap |
| Last 24-hour Volume |
| Last 24-hour Change |
| Last update time |

> 1. The above details can be pulled from server using ```/simple/price```
> 
> 2. The details should support auto-updates as well as manual updates.
