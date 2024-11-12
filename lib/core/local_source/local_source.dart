import 'package:malina_delivery/core/product_model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalSource {
  final Database database;

  LocalSource(this.database);

  ///insert data
  Future<int> insertEvent(Product event) async {
    return await database.insert(
      'products',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Update product data in the database
  Future<int> updateEvent(Product event) async {
    return await database.update(
      'products',
      event.toMap(),
      where: 'product_id = ?',
      whereArgs: [event.productId],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///get all
  Future<List<Product>> getAllEvents() async {
    final List<Map<String, dynamic>> maps = await database.query('products');
    return List<Product>.from(maps.map((map) => Product.fromMap(map)));
  }

  ///find by id
  Future<Product?> getEventById(String id) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'products',
      where: 'product_id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Product.fromMap(maps.first);
    } else {
      return null;
    }
  }

  ///delete by id
  Future<int> deleteEventById(String id) async {
    return await database.delete(
      'products',
      where: 'product_id = ?',
      whereArgs: [id],
    );
  }

  ///delete by product and order type
  Future<void> deleteProductByTypeAndOrder(
      String productType, String orderType) async {
    await database.delete(
      'products',
      where: 'product_type = ? AND order_type = ?',
      whereArgs: [productType, orderType],
    );
  }
}
