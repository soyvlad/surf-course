class Bond {
  // приватное поле _name (название облигации)
  final String _name;
  // приватное поле _ticker (тикер облигации)
  final String _ticker;
  // приватное поле _actualPrice (актульная цена облигации)
  final double _actualPrice;
  // приватное поле _coupon (выплачиваемая сумма 1 купона)
  final double _coupon;
  final date = DateTime.parse('2024-05-22');

  Bond(this._name, this._ticker,
      [this._actualPrice = 1000, this._coupon = 36.6]);

  void buyBond() {
    print(
        'Вы купили $_name $_ticker за $_actualPrice рублей с выплатой купона $date в размере $_coupon рублей за один купон');
  }
}
