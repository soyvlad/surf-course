// Определение класса Article (товар) с полями id, type, name, price, quantity.
class Article {
  final int id;
  final String type;
  final String name;
  final double price;
  final int quantity;

// Конструктор класса Article, который принимает значения id, type, name, price, quantity и инициализирует соответствующие поля.
  Article(this.id, this.type, this.name, this.price, this.quantity);

  @override
  String toString() => '$id\t $type\t $name\t $price рублей\t $quantity шт.';
}

// Определение абстрактного класса Filter.
abstract class Filter {
// Объявление абстрактного метода apply, который принимает объект класса Article и возвращает булево значение.
  bool apply(Article article);
}

// Определение класса TypeFilter, который реализует интерфейс Filter.
class TypeFilter implements Filter {
  final String type;
// Конструктор класса TypeFilter, принимающий значение type и инициализирующий соответствующее поле.
  TypeFilter(this.type);
// Переопределение метода apply из интерфейса Filter в классе TypeFilter, который проверяет соответствие типа товара.
  @override
  bool apply(Article article) {
    return article.type == type;
  }
}

// Определение класса PriceFilter, который реализует интерфейс Filter.
class PriceFilter implements Filter {
  final double maxPrice;
// Конструктор класса PriceFilter, принимающий значение maxPrice и инициализирующий соответствующее поле.
  PriceFilter(this.maxPrice);

// Переопределение метода apply из интерфейса Filter в классе PriceFilter, который проверяет цену товара.
  @override
  bool apply(Article article) {
    return article.price <= maxPrice;
  }
}

// Определение класса QuantityFilter, который реализует интерфейс Filter.
class QuantityFilter implements Filter {
  final int maxQuantity;
// Конструктор класса QuantityFilter, принимающий значение maxQuantity и инициализирующий соответствующее поле.
  QuantityFilter(this.maxQuantity);
// Переопределение метода apply из интерфейса Filter в классе QuantityFilter, который проверяет количество товара.
  @override
  bool apply(Article article) {
    return article.quantity >= maxQuantity;
  }
}

// Определение функции applyFilter, которая принимает список продуктов и фильтр, применяет фильтр к каждому товару и выводит результаты.
void applyFilter(List<Article> articles, Filter filter) {
  final filteredArticles = articles.where(filter.apply).toList();
  print('Id:\t Категория:\t Наименование:\t Цена:\t Количество:');
  for (var article in filteredArticles) {
    if (filter.apply(article)) {
      print(article.toString());
    }
  }
}

// Определение функции main, в которой создается список продуктов, применяются различные фильтры к этому списку и результаты выводятся на экран.
void main() {
  final articles = '''
    1,хлеб,Бородинский,500,5
    2,хлеб,Белый,200,15
    3,молоко,Полосатый кот,50,53
    4,молоко,Коровка,50,53
    5,вода,Апельсин,25,100
    6,вода,Бородинский,500,5
  ''';
  final articleList = parseArticles(articles);

  print('\n Фильтрация по категории "хлеб": \n');
  applyFilter(articleList, TypeFilter('хлеб'));

  print('\n Фильтрация по цене не дороже 300 рублей: \n');
  applyFilter(articleList, PriceFilter(300));

  print('\n Фильтрация по количеству не меньше 10 шт.: \n');
  applyFilter(articleList, QuantityFilter(10));
}

List<Article> parseArticles(String articlesString) {
  final List<Article> result = [];
  final lines = articlesString.trim().split('\n');
  for (var line in lines) {
    final parts = line.trim().split(',');
    if (parts.length == 5) {
      final id = int.parse(parts[0]);
      final type = parts[1];
      final name = parts[2];
      final price = double.parse(parts[3]);
      final quantity = int.parse(parts[4]);
      final article = Article(id, type, name, price, quantity);
      result.add(article);
    }
  }
  return result;
}
