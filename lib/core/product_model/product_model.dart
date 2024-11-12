class Product {
  int? id;
  String productId;
  String productName;
  int productCount;
  bool inBasket;
  String orderType;
  String productType;

  Product({
    this.id,
    required this.productId,
    required this.productName,
    required this.productCount,
    required this.inBasket,
    required this.orderType,
    required this.productType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_count': productCount,
      'in_basket': inBasket ? 1 : 0,
      'order_type': orderType,
      'product_type': productType,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      productId: map['product_id'],
      productName: map['product_name'],
      productCount: map['product_count'],
      inBasket: map['in_basket'] == 1,
      orderType: map['order_type'],
      productType: map['product_type'],
    );
  }
}
