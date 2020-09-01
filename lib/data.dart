List<Vegetables> data = [
  Vegetables(name: 'onion', price: 100.0, count: 0),
  Vegetables(name: 'tomato', price: 100.0, count: 0),
  Vegetables(name: 'pineapple', price: 100.0, count: 0),
  Vegetables(name: 'peach', price: 100.0, count: 0),
];

class Vegetables {
  String name;
  double price;
  int count;

  Vegetables({this.name, this.price, this.count});

  Vegetables.existing(Vegetables vegetables) {
    this.name = vegetables.name;
    this.price = vegetables.price;
    count = vegetables.count;
  }

  void increaseCount() {
    print(count);
    count ++;
  }

  void decreaseCount() {
    print(count);
    count --;
    print(count);
  }
}