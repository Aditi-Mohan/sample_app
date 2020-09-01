import 'package:flutter/material.dart';
import 'package:sampleapp/card_tile.dart';
import 'package:sampleapp/cart_icon.dart';
import 'package:sampleapp/checkout_page.dart';
import 'package:sampleapp/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cartCounter;

  List<Vegetables> getOrder() {
    List<Vegetables> order = [];
    for( int i=0; i<data.length; i++) {
      if( data[i].count != 0)
        order.add(data[i]);
    }
    return order;
  }

  @override
  void initState() {
    super.initState();
    _cartCounter = 0;
  }

  void _increment() {
    setState(() {
      _cartCounter++;
    });
  }

  void _decrement() {
    setState(() {
      _cartCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 68, 1, 1),
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sample App", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(order: getOrder(),)));
                },
                  child: CartIcon(items: _cartCounter,)
              )
            ],
          ),
        )
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CardTile(veggie: data[index], increment: _increment, decrement: _decrement,);
                }
            ),
          )
        ],
      ),
    );
  }
}
