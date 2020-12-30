import 'package:groceries_list/database/database.dart';
import 'package:groceries_list/model/item.dart';

class GroceryDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Item records
  Future<int> createItem(Item item) async {
    final db = await dbProvider.database;
    var result = db.insert(groceryTABLE, item.toDatabaseJson());
    return result;
  }

  //Get All Item items
  //Searches if query string was passed
  Future<List<Item>> getItems({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(groceryTABLE,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(groceryTABLE, columns: columns);
    }

    List<Item> items = result.isNotEmpty
        ? result.map((item) => Item.fromJson(item)).toList()
        : [];
    return items;
  }

  //Update Item record
  Future<int> updateItem(Item item) async {
    final db = await dbProvider.database;

    var result = await db.update(groceryTABLE, item.toDatabaseJson(),
        where: "id = ?", whereArgs: [item.id]);

    return result;
  }

  //Delete Item records
  Future<int> deleteItem(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(groceryTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllItems() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      groceryTABLE,
    );

    return result;
  }
}
