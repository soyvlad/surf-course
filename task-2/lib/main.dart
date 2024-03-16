import 'package:collection/collection.dart';

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  var allFarmMachineryUnits =
      <AgriculturalMachinery>{}; /*Сотавляю единый список всей техники, находящейся на всех угодьях*/

  mapBefore2010.forEach((_, territoryList) {
    for (var value in territoryList) {
      allFarmMachineryUnits.addAll(value.machineries);
    }
  }); /*Наполняю список из старой базы*/

  mapAfter2010.forEach(
    (_, territoryList) {
      for (var value in territoryList) {
        allFarmMachineryUnits.addAll(value.machineries);
      }
    },
  ); /*Наполняю список из новой базы*/

  final machineriesList = allFarmMachineryUnits.toList();

  final averageAgeFarmMachineries = DateTime.now().year -
      (machineriesList.map((e) => e.releaseDate.year).average.round());
  print(
      "Средний возраст всей техники на всех угодьях: $averageAgeFarmMachineries лет"); /*Вывожу средний возраст всей технки*/

  machineriesList.sort(
      (a, b) => a.releaseDate.compareTo(b.releaseDate)); /*Сортирую список*/

  final fiftyPercentOfAllFarmMachinaries =
      machineriesList.sublist(0, (machineriesList.length / 2).round());

  final averageFiftyPercentOfAllFarmMachinaries = DateTime.now().year -
      (fiftyPercentOfAllFarmMachinaries
          .map((e) => e.releaseDate.year)
          .average
          .round());

  print(
      'Средний возраст из половины старой техники составляет $averageFiftyPercentOfAllFarmMachinaries лет'); //Вывожу итог 2 задачи
}
