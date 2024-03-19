// определение класса Article (товар) с полями id, type, name, price, quantity
class Article {
  final int id;
  final String type;
  final String name;
  final double price;
  final int quantity;

// конструктор класса Article, который принимает значения id, type, name, price, quantity и инициализирует соответствующие поля
  Article(this.id, this.type, this.name, this.price, this.quantity);
}

// определение абстрактного класса Filter
abstract class Filter {
// объявление абстрактного метода apply, который принимает объект класса Article и возвращает булево значение
  bool apply(Article article);
}

// определение класса TypeFilter, который реализует интерфейс Filter
class TypeFilter implements Filter {
  final String type;
// конструктор класса TypeFilter, принимающий значение type и инициализирующий соответствующее поле
  TypeFilter(this.type);
// переопределение метода apply из интерфейса Filter в классе TypeFilter, который проверяет соответствие типа товара
  @override
  bool apply(Article article) {
    return article.type == type;
  }
}

// определение класса PriceFilter, который реализует интерфейс Filter
class PriceFilter implements Filter {
  final double maxPrice;
// конструктор класса PriceFilter, принимающий значение maxPrice и инициализирующий соответствующее поле
  PriceFilter(this.maxPrice);

// переопределение метода apply из интерфейса Filter в классе PriceFilter, который проверяет цену товара
  @override
  bool apply(Article article) {
    return article.price <= maxPrice;
  }
}

// определение класса QuantityFilter, который реализует интерфейс Filter
class QuantityFilter implements Filter {
  final int maxQuantity;
// конструктор класса QuantityFilter, принимающий значение maxQuantity и инициализирующий соответствующее поле
  QuantityFilter(this.maxQuantity);
// переопределение метода apply из интерфейса Filter в классе QuantityFilter, который проверяет количество товара
  @override
  bool apply(Article article) {
    return article.quantity >= maxQuantity;
  }
}

// определение функции applyFilter, которая принимает список продуктов и фильтр, применяет фильтр к каждому товару и выводит результаты
void applyFilter(List<Article> articles, Filter filter) {
  print('Id\tType\tName\tPrice\tQuantity');

  for (var article in articles) {
    if (filter.apply(article)) {
      print(
          '${article.id}\t ${article.type}\t ${article.name}\t ${article.price} рублей\t  ${article.quantity} шт.');
    }
  }
}

// определение функции main, в которой создается список продуктов, применяются различные фильтры к этому списку и результаты выводятся на экран
void main() {
  List<Article> articleList = [
    Article(1, 'хлеб', 'Бородинский', 500, 5),
    Article(2, 'хлеб', 'Белый', 200, 15),
    Article(3, 'молоко', 'Полосатый кот', 50, 53),
    Article(4, 'молоко', 'Коровка', 50, 53),
    Article(5, 'вода', 'Апельсин', 25, 100),
    Article(6, 'вода', 'Бородинский', 500, 5)
  ];

  print('Фильтрация по категории: хлеб');
  applyFilter(articleList, TypeFilter('хлеб'));

  print('Фильтрация по цене не дороже 300 рублей');
  applyFilter(articleList, PriceFilter(300));

  print('Фильтрация по количеству не меньше 10 шт.');
  applyFilter(articleList, QuantityFilter(10));
}
