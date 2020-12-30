class Item {
  final int id;
  final String itemName;
  final int quantity;
  final bool isBought;

  Item({this.id, this.quantity, this.itemName, this.isBought});

  factory Item.fromJson(Map<String, dynamic> data) {
    return Item(
      id: data['id'],
      itemName: data['itemName'],
      quantity: data['quantity'],
      isBought: data['isBought'] == 0 ? false : true,
    );
  }

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "itemName": this.itemName,
        "quantity": this.quantity,
        "isBought": this.isBought == false ? 0 : 1,
      };
}
