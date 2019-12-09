import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/jsonDemo/Order.dart';

main() => runApp(JsonTestWidget());

class JsonTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JsonTestWidgetState();
}

class JsonTestWidgetState extends State<JsonTestWidget> {
//  static List<Order> orders = [
//    Order("orderAdd", 55),
//    DiscountOrder("discOrd", 33, 5),
//    ChristmasOrder("christAdd", 11, "Hohoho!"),
//  ];

  List<Order> serializedOrders = [];

  JsonTestWidgetState() {
//    print("Liste: $orders");

//    List<String> jsons = [];
    // [{"price":55.0,"address":"orderAdd"}, {"price":33.0,"address":"discOrd","discount":5}, {"price":11.0,"address":"christAdd","greeting":"Hohoho!"}]
//    for (Order order in orders) {
//      jsons.add(jsonEncode(order));
//    }

    List<String> jsons = [
      "{\"price\":55.0,\"address\":\"orderAdd\"}",
      "{\"price\":33.0,\"address\":\"discOrd\",\"discount\":5}",
      "{\"price\":11.0,\"address\":\"christAdd\",\"greeting\":\"Hohoho!\"}"
    ];

    print("Strings: $jsons");

    for (String jsString in jsons) {
      Map orderMap = jsonDecode(jsString);

      Order order = null;
      if (orderMap.containsKey("discount")) {
        order = DiscountOrder.fromJson(orderMap);
      } else if (orderMap.containsKey("greeting")) {
        order = ChristmasOrder.fromJson(orderMap);
      } else {
        order = Order.fromJson(orderMap);
      }

      serializedOrders.add(order);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JsonTest",
      home: Scaffold(
        appBar: AppBar(
          title: Text("JsonTest"),
        ),
        body: ListView.builder(
          itemCount: serializedOrders.length,
          itemBuilder: (context, index) {
            Order order = serializedOrders[index];
            if (order is DiscountOrder) {
              return ListTile(
                title: Text(order.address),
                subtitle:
                    Text("Price: ${order.price} Discount: ${order.discount}"),
              );
            } else if (order is ChristmasOrder) {
              return ListTile(
                title: Text(order.address),
                subtitle: Text(
                    "Price: ${order.price} Greeting: ${order.greeting} Present: ${order.present}"),
              );
            }
            return ListTile(
              title: Text(order.address),
              subtitle: Text("Price: ${order.price}"),
            );
          },
        ),
      ),
    );
  }
}
