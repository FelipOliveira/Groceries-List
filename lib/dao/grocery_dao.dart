import 'package:groceries_list/database/database.dart';
import 'package:groceries_list/model/item.dart';

class GroceryDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createItem(Item item) async {
    final db = await dbProvider.database;
    var result = db.insert(groceryTABLE, item.toDatabaseJson());
    return result;
  }

  //Searches if query string was passed
  Future<List<Item>> getItemsList({List<String> columns, String query}) async {
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

  Future<int> updateItem(Item item) async {
    final db = await dbProvider.database;

    var result = await db.update(groceryTABLE, item.toDatabaseJson(),
        where: "id = ?", whereArgs: [item.id]);

    return result;
  }

  Future<int> deleteItem(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(groceryTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future clearItemsList() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      groceryTABLE,
    );

    return result;
  }
}
