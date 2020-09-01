import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatefulWidget {
  final int items;

  CartIcon({this.items});

  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(Icons.shopping_cart, size: 40.0, color: widget.items == 0? Colors.grey: Colors.white),
          widget.items == 0? Container():
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                  child: Center(child: Text("${widget.items}", style: TextStyle(fontSize: 12.0, color: Colors.white))),
                ),
              )
        ],
      ),
    );
  }
}
