import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleapp/data.dart';

class CheckoutPage extends StatefulWidget {
  List<Vegetables> order;

  CheckoutPage({this.order});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int totalOrders = 0;
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    for( int i=0; i<widget.order.length; i++) {
      totalOrders += widget.order[i].count;
      totalPrice += widget.order[i].count * widget.order[i].price;
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _key = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 68, 1, 1),
        title: Text("Your Order Details", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Builder(
        builder: (context) {
          if(widget.order.length == 0)
            return Center(
              child: Card(
                elevation: 0.0,
                child: Text("No Order Placed Yet", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400)),
              ),
            );
          else
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text("ITEM", style: TextStyle(fontSize: 18.0),)),
                          DataColumn(label: Text("QTY", style: TextStyle(fontSize: 18.0),)),
                          DataColumn(label: Text("PRICE", style: TextStyle(fontSize: 18.0),)),
                        ],
                        rows: widget.order.map((e) => DataRow(
                            cells: [
                              DataCell(Text("${e.name.toUpperCase()}", style: TextStyle(fontSize: 18.0),)),
                              DataCell(Text("${e.count}", style: TextStyle(fontSize: 18.0),)),
                              DataCell(Text("${e.count * e.price}", style: TextStyle(fontSize: 18.0),)),
                            ]
                        )).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
                  child: Card(
                    elevation: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Amount: ", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
                        Text("$totalPrice", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                )
              ],
            );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: widget.order.length == 0 ? Colors.grey: Theme.of(context).primaryColor,
        onPressed: () {
          if( widget.order.length != 0)
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Order Placed!"),));
        },
        label: Text("Place Order"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
