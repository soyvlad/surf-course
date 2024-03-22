import 'bond.dart';

class Asset {
  // Общий конструктор для класcа "Активы" (Asset)
  Asset(
      {required this.kind,
      required this.name,
      required this.ticker,
      required this.actualPrice});

  // Именнованный конструктор 1 (для акций)
  Asset.share(
      {required this.kind,
      required this.name,
      required this.ticker,
      required this.actualPrice});

  // Именнованный конструктор 2 (для фондов, паев)
  Asset.fonds(
      {required this.kind,
      required this.name,
      required this.ticker,
      required this.actualPrice});

  final String kind;
  final String name;
  final String ticker;
  final double actualPrice;
  final double _callPrice = 7000.0;
  final double _putPrice = 8000.0;
  final now = DateTime.now();

// Метод для покупки бумаги (акций)
  void buyShare() {
    if (_callPrice < 7001) {
      print('Вы купили $kind $name за $_callPrice рублей в $now');
    }
  }

// Метод для продажи бумаги (акций)
  void sellShare() {
    if (_putPrice >= 8000) {
      print('Вы продали $kind $name за $_putPrice рублей в $now');
    }
  }
}

// Вложенный класс Crypto
class Crypto {
  final String name;
  final String smartChain;

  Crypto(this.name, this.smartChain);
  void openEwallet() {
    print("Ваши криптоактивы");
  }
}

void main() {
  // Создаём 1 объект класса Asset
  Asset share_1 = Asset.share(
      kind: 'Акции', name: 'Лукойл', ticker: 'LKOH', actualPrice: 7650);
  // Обращаемся к полю ticker первого объекта
  print(share_1.ticker);
  // Обращаемся к методу buyShare для покупки бумаги (акций) - 1 обекта
  share_1.buyShare();

  // Создаём 2 объект класса Asset
  Asset share_2 = Asset.share(
      kind: 'Акции', name: "Магнит", ticker: 'MGNT', actualPrice: 7735);
  // Обращаемся к полю name второго объекта
  print(share_2.name);
  // Обращаемся к методу sellShare для продажи бумаги (акций) - 2 объекта
  share_2.sellShare();

  // Создаём объект скрытого класа Bond
  Bond bondOFZ = Bond('ОФЗ', 'SU29007RMFS0');
  // Обращаемся к методу buyBond скрытого класса Bond
  bondOFZ.buyBond();
}
