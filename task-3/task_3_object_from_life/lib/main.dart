class Asset {
  Asset({
    required this.kind,
    required this.name,
    required this.ticker,
    // required this.actualPrice
  });

// Приватные поля
  String kind;
  final String name;
  String ticker;
  double? actualPrice;
  // ignore: unused_field
  double? _dividend;
  final double _callPrice = 7000.0;
  final double _putPrice = 8000.0;

// Константы для всех объектов этого класса
  static double get commission => 0.01;

  set dividend(double value) {
    _dividend = value > 0 && value < 548 ? value : 0;
  }

// Метод для покупки бумаги
  void buyShare() {
    if (_callPrice < 7001) {
      print('Вы купили $kind $name за $_callPrice');
      return;
    }
  }

// Метод для продажи бумаги
  void sellShare() {
    if (_putPrice >= 8000) {
      print('Вы продали $kind $name за $_putPrice');
      return;
    }
  }
}

// Вложенный класс "Облигации"
class Bonds {
  final String name;
  String ticker;
  double? price;
  double coupon;

  Bonds(this.name, this.ticker, this.coupon);
}

void buyBonds() {
  print(Bonds);
}

// Создаем объект класса Asset с использованием различных конструкторов
void main() {
  // ignore: unused_local_variable
  Bonds ofz = Bonds('ОФЗ', 'SU29007RMFS0', 78.63);
  // ignore: unused_local_variable
  Bonds corporativniy = Bonds('Whoosh', 'RU000A106HB4', 29.42);

  final share_1 = Asset(kind: 'Акции', name: 'Лукойл', ticker: 'LKOH');
  final share_2 = Asset(kind: 'Акции', name: "Магнит", ticker: 'MGNT');

// Используем методы и свойства объекта
  share_1.buyShare();
  share_1.sellShare();

  share_2.sellShare();
}
