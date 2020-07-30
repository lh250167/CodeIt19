import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/product.dart';
//import 'package:flutter_icons/flutter_icons.dart';

String lorem = "Yurgan";

List<Product> productsList = Product.listFromJson([
  {
    "id": "d290f1ee-6c54-4b01-90e6-d701748f0851",
    "name": "Sugar",
    "releaseDate": "2016-08-29T09:12:33.001Z",
    "manufacturer": {
      "name": "ACME Corporation",
      "homePage": "https://www.acme-corp.com",
      "phone": "408-867-5309"
    },
    "category": {"name": "Dairy"},
    "amount": 1,
    "price": 6.99,
    "currency": "\$",
    "image_url": "assets/DemeraraSugar.png"
  },
  {
    "id": "d290f1ee-6c54-4b01-90e6-d701748f0851",
    "name": "Bread",
    "releaseDate": "2016-08-29T09:12:33.001Z",
    "manufacturer": {
      "name": "ACME Corporation",
      "homePage": "https://www.acme-corp.com",
      "phone": "408-867-5309"
    },
    "category": {"name": "Bakery"},
    "amount": 2,
    "price": 12.99,
    "currency": "\$",
    "image_url": "assets/MultiGrainBread.jpg"
  }
]);
