class ShippingDetails {
  String name = null;

  String street = null;

  String houseNumber = null;

  String city = null;

  String phone = null;

  ShippingDetails({String title});

  @override
  String toString() {
    return 'ShippingDetails[name=$name, street=$street, houseNumber=$houseNumber, city=$city, phone=$phone, ]';
  }

  ShippingDetails.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    street = json['street'];
    houseNumber = json['houseNumber'];
    city = json['city'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'street': street,
      'houseNumber': houseNumber,
      'city': city,
      'phone': phone
    };
  }

  static List<ShippingDetails> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<ShippingDetails>()
        : json.map((value) => new ShippingDetails.fromJson(value)).toList();
  }

  static Map<String, ShippingDetails> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ShippingDetails>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ShippingDetails.fromJson(value));
    }
    return map;
  }
}
