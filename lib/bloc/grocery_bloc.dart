import 'dart:async';
import 'package:groceries_list/model/item.dart';
import 'package:groceries_list/repository/grocery_repository.dart';

class GroceryBloc {
  final _groceryRepository = GroceryRepository();

  final _itemController = StreamController<List<Item>>.broadcast();
  get items => _itemController.stream;

  GroceryBloc() {
    getItems();
  }

  getItems({String query}) async {
    _itemController.sink
        .add(await _groceryRepository.getAllItems(query: query));
  }

  addItem(Item item) async {
    _itemController.sink.add(await _groceryRepository.insertItem(item));
  }

  updateItem(Item item) async {
    _itemController.sink.add(await _groceryRepository.updateItem(item));
  }

  deleteItem(int id) async {
    _itemController.sink.add(await _groceryRepository.deleteItemById(id));
  }

  deleteAllItems() async {
    _itemController.sink.add(await _groceryRepository.deleteAllItems());
  }

  dispose() {
    _itemController.close();
  }
}
