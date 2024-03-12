import 'bond.dart';

class Asset {
  // Конструктор
  Asset(
      {required this.kind,
      required this.name,
      required this.ticker,
      required this.actualPrice});

  // Именнованный конструктор 1
  Asset.share(
      {required this.kind,
      required this.name,
      required this.ticker,
      required this.actualPrice});

  // Именнованный конструктор 2
  Asset.fonds(
      {required this.kind,
      required this.name,
      required this.ticker,
      required this.actualPrice});

  late final String kind;
  final String name;
  String ticker;
  final double actualPrice;
  final double _callPrice = 7000.0;
  final double _putPrice = 8000.0;
  final now = DateTime.now();

// Метод для покупки бумаги
  void buyShare() {
    if (_callPrice < 7001) {
      print('Вы купили $kind $name за $_callPrice рублей в $now');
    }
  }

// Метод для продажи бумаги
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
  // Обращаемся к полю ticker
  print(share_1.ticker);
  // Обращаемся к методу buyShare
  share_1.buyShare();

  // Создаём 2 объект класса Asset
  Asset share_2 = Asset.share(
      kind: 'Акции', name: "Магнит", ticker: 'MGNT', actualPrice: 7735);
  // Обращаемся к полю name
  print(share_2.name);
  // Обращаемся к методу sellShare
  share_2.sellShare();

  // Создаём объект скрытого класа Bond
  Bond bond_ofz = Bond('ОФЗ', 'SU29007RMFS0');
  // Обращаемся к методу buyBond скрытого класса Bond
  bond_ofz.buyBond();
}
