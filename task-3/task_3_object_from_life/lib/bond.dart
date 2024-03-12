//import 'package:task_3_object_from_life/main.dart';

class Bond {
  final String _name; // приватное поле _name
  final String _ticker; // приватное поле _ticker
  final double _actualPrice = 1000; // приватное поле _actualPrice
  final double _coupon = 36.6; // приватное поле _coupon
  final month = DateTime.parse('2024-05-22');

  Bond(this._name, this._ticker) {
    _coupon;
    _actualPrice;
  }

  void buyBond() {
    print(
        'Вы купили $_name $_ticker за $_actualPrice с выплатой купона $month в размере $_coupon рублей за один купон');
  }
}
