import 'package:shopper_buddy/Model/sopping_cart_item.dart';

class ShoppingCart {
  String id = null;

  String state = null;

  List<SoppingCartItem> products = [];

  ShoppingCart();

  @override
  String toString() {
    return 'ShoppingCart[id=$id, state=$state, products=$products, ]';
  }

  ShoppingCart.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    state = json['state'];
    products = SoppingCartItem.listFromJson(json['products']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'state': state, 'products': products};
  }

  static List<ShoppingCart> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<ShoppingCart>()
        : json.map((value) => new ShoppingCart.fromJson(value)).toList();
  }

  static Map<String, ShoppingCart> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ShoppingCart>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ShoppingCart.fromJson(value));
    }
    return map;
  }
}
