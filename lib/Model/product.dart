import 'package:shopper_buddy/Model/category.dart';
import 'package:shopper_buddy/Model/manufacturer.dart';

class Product {
  String id = null;

  String name = null;

  DateTime releaseDate = null;

  Manufacturer manufacturer = null;

  Category category = null;

  num price = null;

  num amount = null;

  String currency = null;

  String imageUrl = null;

  Product();

  @override
  String toString() {
    return 'Product[id=$id, name=$name, releaseDate=$releaseDate, manufacturer=$manufacturer, category=$category, price=$price, amount=$amount, currency=$currency, imageUrl=$imageUrl, ]';
  }

  Product.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    releaseDate = json['releaseDate'] == null
        ? null
        : DateTime.parse(json['releaseDate']);
    manufacturer = new Manufacturer.fromJson(json['manufacturer']);
    category = new Category.fromJson(json['category']);
    price = json['price'];
    amount = json['amount'];
    currency = json['currency'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'releaseDate':
          releaseDate == null ? '' : releaseDate.toUtc().toIso8601String(),
      'manufacturer': manufacturer,
      'category': category,
      'price': price,
      'amount': amount,
      'currency': currency,
      'image_url': imageUrl
    };
  }

  static List<Product> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<Product>()
        : json.map((value) => new Product.fromJson(value)).toList();
  }

  static Map<String, Product> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Product>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Product.fromJson(value));
    }
    return map;
  }
}
