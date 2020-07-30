class SoppingCartItem {
  String productId = null;

  num quantity = null;

  DateTime createdDate = null;

  SoppingCartItem();

  @override
  String toString() {
    return 'SoppingCartItem[productId=$productId, quantity=$quantity, createdDate=$createdDate, ]';
  }

  SoppingCartItem.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    productId = json['productId'];
    quantity = json['quantity'];
    createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'createdDate':
          createdDate == null ? '' : createdDate.toUtc().toIso8601String()
    };
  }

  static List<SoppingCartItem> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<SoppingCartItem>()
        : json.map((value) => new SoppingCartItem.fromJson(value)).toList();
  }

  static Map<String, SoppingCartItem> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SoppingCartItem>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new SoppingCartItem.fromJson(value));
    }
    return map;
  }
}
