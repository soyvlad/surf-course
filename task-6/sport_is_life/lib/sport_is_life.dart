void main() {
  Fighter tim =
      Fighter("Tim Means", 40, 'the USA', 'Welterweight', 188, 33, 15, 20, 5);
  tim.displayInfo();

  Coach tom = Coach('Tom Vaughn', 50, "the USA", 20);
  tom.displayInfo();

  Fighter conor = Fighter(
      'Conor McGregor', 35, 'Ireland', 'Lightweight', 173, 22, 6, 19, 1);
  conor.displayInfo();

  Fighter conorBusiness =
      Fighter.bussinesman('Conor McGregor', 35, 'Ireland', "the USA");
  conorBusiness.produceWhiskey();
}

// базовый класс Person
class Person {
  String name = "";
  int age = 0;
  String country = "";
  Person(this.name, this.age, this.country);
  void displayInfo() => print('Name: $name. Age: $age. Country: $country.');
}

// производный класс Fighter представляет бойца с помощью следующих полей хранит инфу
class Fighter extends Person {
  String division = "";
  int height = 0;
  int win = 0;
  int lost = 0;
  int tko = 0;
  int sub = 0;
  String country1 = "";

  Fighter(super.name, super.age, super.country, this.division, this.height,
      this.win, this.lost, this.tko, this.sub);
// именнованный конструктор вызывает основной конструктор + новое поле
  Fighter.bussinesman(super.name, super.age, super.country, this.country1);

// переопределяем метод displayInfo
  @override
  void displayInfo() {
// Вызов реализации из класса Person
    super.displayInfo();
    print(
        'Height: $height. Currently competing in: $division division. Amount of wins: $win. Amount of losses: $lost. Wins by knockout: $tko. Wins by submission: $sub. \n');
  }

// новый метод чисто для Конора бизнесмена
  void produceWhiskey() {
    print(
        '$name launched Proper No.Twelve Irish whiskey in $country and $country1.The whiskey is named after the Crumlin neighbourhood in Dublin 12, in which McGregor grew up.\n');
  }
}

// производный класс Coach
class Coach extends Person {
  int yearsActive = 0;
  Coach(super.name, super.age, super.country, this.yearsActive);
  @override
  void displayInfo() {
    print(
        "The UFC coach $name has been training for $yearsActive years in $country.\n");
  }
}
