import 'package:groceries_list/model/item.dart';

abstract class GroceryRepository {
  Future<List<Item>> getGroceriesList();
  Future<int> updateItem(Item item);
  Future<int> deleteItem(int id);
  Future<int> createItem(Item item);
}
