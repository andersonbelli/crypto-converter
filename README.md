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


## Screenshots

1. HomeScreen (Select coin list)

![Simulator Screen Shot - iPhone 11 - 2023-02-22 at 18 23 18](https://user-images.githubusercontent.com/24509402/220762934-ea58bfe3-51b4-4480-a71f-6fbc379ebe83.png)

2. Select currency to compare with selected coin

![Simulator Screen Shot - iPhone 11 - 2023-02-22 at 18 23 24](https://user-images.githubusercontent.com/24509402/220763082-f4d4c0ee-e3d8-4679-aee2-81bdca86f6d1.png)

3. Compare Coin and Currency

- Compare Coins screen
![Simulator Screen Shot - iPhone 11 - 2023-02-22 at 18 23 32](https://user-images.githubusercontent.com/24509402/220763168-b741d680-4c58-49ed-bd75-cb9d3a15a556.png)

- Back to home screen alert
![Simulator Screen Shot - iPhone 11 - 2023-02-22 at 18 23 41](https://user-images.githubusercontent.com/24509402/220763236-25b827ba-3757-4ea0-ad51-69b880ceff61.png)



