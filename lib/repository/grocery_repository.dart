import 'package:groceries_list/dao/grocery_dao.dart';
import 'package:groceries_list/model/item.dart';

class GroceryRepository {
  final dao = GroceryDao();

  Future getAllItems({String query}) => dao.getItemsList(query: query);
  Future insertItem(Item item) => dao.createItem(item);
  Future updateItem(Item item) => dao.updateItem(item);
  Future deleteItemById(int id) => dao.deleteItem(id);
  Future deleteAllItems() => dao.clearItemsList();
}
