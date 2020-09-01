import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleapp/data.dart';

class CardTile extends StatefulWidget {
  final Vegetables veggie;
  final VoidCallback increment;
  final VoidCallback decrement;

  CardTile({this.veggie, this.increment, this.decrement});

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
              child: ListTile(
                title: Text("${widget.veggie.name.toUpperCase()}", style: TextStyle(fontSize: 18.0),),
                subtitle: Text("${widget.veggie.price} per Kg", style: TextStyle(fontSize: 16.0),),
                trailing: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.veggie.increaseCount();
                          widget.increment();
                        },
                        child: Icon(Icons.add,size: 18.0,),
                      ),
                      Container(
                        child: Text("${widget.veggie.count}", style: TextStyle(fontSize: 18.0),),
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.veggie.count != 0) {
                            widget.veggie.decreaseCount();
                            widget.decrement();
                          }
                        },
                        child: Icon(Icons.remove, size: 18.0,),
                      ),
                    ],
                  ),
                ),
              )
          );
  }
}
