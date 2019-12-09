import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/jsonDemo/Order.dart';

main() => runApp(JsonTestWidget());

class JsonTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JsonTestWidgetState();
}

class JsonTestWidgetState extends State<JsonTestWidget> {
  static List<Order> orders = [
    Order("orderAdd", 55),
    DiscountOrder("discOrd", 33, 5),
    ChristmasOrder("christAdd", 11, "Hohoho!"),
  ];

  List<Order> serializedOrders = orders;

  JsonTestWidgetState() {}

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
                subtitle:
                    Text("Price: ${order.price} Greeting: ${order.greeting}"),
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
