class PokerPlayer {
  /// Список текущих карт в руке у игрока
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double _surenessInWin = 0;

  /// Вычислить шансы на выигрыш

  void calculateProbabilities(
    List<String> cardOnDesk,

    /// Это часть первого задания. [Strategy] пока не сущестивует.
    ///
    /// Опишите его.
    Strategy strategy,
  ) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

typedef Strategy = Function(List, List);

void main() {
  final opponent = PokerPlayer();

  /// Это часть первого задания. [Strategy] пока не сущестивует.
  ///
  /// Опишите его.
  fakeStrategy(p0, p1) {
    /// Ваш код - здесь
    print('Карты на столе: $p0 \n Карты опонента: $p1');
  }

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'King of hearts'],
    fakeStrategy,
  );
}
