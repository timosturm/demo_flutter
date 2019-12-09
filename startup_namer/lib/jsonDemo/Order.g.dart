// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(json['address'] as String, (json['price'] as num)?.toDouble());
}

Map<String, dynamic> _$OrderToJson(Order instance) =>
    <String, dynamic>{'price': instance.price, 'address': instance.address};

DiscountOrder _$DiscountOrderFromJson(Map<String, dynamic> json) {
  return DiscountOrder(json['address'] as String,
      (json['price'] as num)?.toDouble(), json['discount'] as int);
}

Map<String, dynamic> _$DiscountOrderToJson(DiscountOrder instance) =>
    <String, dynamic>{
      'price': instance.price,
      'address': instance.address,
      'discount': instance.discount
    };

ChristmasOrder _$ChristmasOrderFromJson(Map<String, dynamic> json) {
  return ChristmasOrder(
      json['address'] as String,
      (json['price'] as num)?.toDouble(),
      json['greeting'] as String,
      json['present'] as String);
}

Map<String, dynamic> _$ChristmasOrderToJson(ChristmasOrder instance) =>
    <String, dynamic>{
      'price': instance.price,
      'address': instance.address,
      'greeting': instance.greeting,
      'present': instance.present
    };
