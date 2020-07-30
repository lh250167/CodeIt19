

class Manufacturer {
  
  String name = null;
  

  String homePage = null;
  

  String phone = null;
  
  Manufacturer();

  @override
  String toString() {
    return 'Manufacturer[name=$name, homePage=$homePage, phone=$phone, ]';
  }

  Manufacturer.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name =
        json['name']
    ;
    homePage =
        json['homePage']
    ;
    phone =
        json['phone']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'homePage': homePage,
      'phone': phone
     };
  }

  static List<Manufacturer> listFromJson(List<dynamic> json) {
    return json == null ? new List<Manufacturer>() : json.map((value) => new Manufacturer.fromJson(value)).toList();
  }

  static Map<String, Manufacturer> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Manufacturer>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Manufacturer.fromJson(value));
    }
    return map;
  }
}

