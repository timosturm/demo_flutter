import 'dart:ffi';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'Order.g.dart';

//part 'DiscountOrder.g.dart';
//part 'ChristmasOrder.g.dart';

@JsonSerializable()
class Order {
  String _address;
  double _price;

  double get price => _price;

  String get address => _address;

  Order(String address, double price)
      : this._price = price,
        this._address = address;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class DiscountOrder extends Order {
  int _discount;
  Uint8List _list;

  int get discount => _discount;

  Uint8List get list => _list;

  DiscountOrder(String address, double price, int discount, Uint8List list)
      : this._discount = discount,
        this._list = list,
        super(address, price);

  factory DiscountOrder.fromJson(Map<String, dynamic> json) =>
      _$DiscountOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountOrderToJson(this);
}

@JsonSerializable()
class ChristmasOrder extends Order {
  String _greeting;
  String _present;

  String get greeting => _greeting;

  String get present => _present;

  ChristmasOrder(String address, double price, String greeting, String present)
      : this._greeting = greeting,
        this._present = present,
        super(address, price);

  factory ChristmasOrder.fromJson(Map<String, dynamic> json) =>
      _$ChristmasOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ChristmasOrderToJson(this);
}
