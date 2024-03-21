import 'list_items.dart';

void main() {
  /// Объявление функции outputData, которая принимает список продуктов
  ///  и возвращает отфильтрованный результат в виде Map<String, Map<String, List<String>>>.
  Map<String, Map<String, List<String>>> outputData(
      List<RawProductItem> listItems) {
    final result = <String, Map<String, List<String>>>{};
    for (var productItem in listItems) {
      if (productItem.expirationDate.isBefore(DateTime.now()) ||
          productItem.qty == 0) {
        continue;
      }
      result.putIfAbsent(productItem.categoryName, () => {});
      result[productItem.categoryName]!
          .putIfAbsent(productItem.subcategoryName, () => []);
      result[productItem.categoryName]![productItem.subcategoryName]!
          .add(productItem.name);
    }
    return result;
  }

  /// Создание переменной newListItems, в которой хранится результат
  ///  работы функции outputData для списка listItems.
  final newListItems = outputData(listItems);

  /// Использование цикла forEach для итерации по списку newListItems
  ///  и вывода информации о каждой категории, подкатегории и продукте на консоль.
  newListItems.forEach((category, subcategory) {
    print('Категория: $category');

    subcategory.forEach((subcategory, productItem) {
      print('\tПодкатегория: $subcategory');

      for (var productItem in newListItems[category]![subcategory]!) {
        print('\t\tТовар: $productItem');
      }
    });
    print('\n');
  });
}
