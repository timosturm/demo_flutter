class Order {
  String _address;
  double _price;

  double get price => _price;

  String get address => _address;

  Order(this._address, this._price);
}

class DiscountOrder extends Order {
  int _discount;

  int get discount => _discount;

  DiscountOrder(String address, double price, this._discount)
      : super(address, price);
}

class ChristmasOrder extends Order {
  String _greeting;

  String get greeting => _greeting;

  ChristmasOrder(String address, double price, this._greeting)
      : super(address, price);
}
