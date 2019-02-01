
import 'package:flutter/material.dart';
import 'global.dart';
import 'dart:convert';
import 'Checkout.dart';
import 'global.dart';

class OrderConfirm extends StatefulWidget {
  final List<dynamic> prices;
  final List<dynamic> items;
  final List<int> nums;
  final String title;
  final String store;
  final String destination;

  final int total;

  OrderConfirm({Key key, this.store, this.destination, this.title, @required this.items, @required this.prices, @required this.nums, @required this.total}) : super(key: key);


  @override
  OrderConfirmState createState() => OrderConfirmState();
}

class OrderConfirmState extends State<OrderConfirm> {

  List<int> j = new List();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: (){Navigator.pop(context,true);}
            ),
            title: const Text('Checkout')),
        body: new SafeArea(

          child: Column(

            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              new ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return new Card(
                      child: new Container(
                        height: 50.0,
                      child: new Row(
                        children: <Widget>[
                          Text(widget.nums[index].toString()+" "+ widget.items[index]+": "+widget.prices[index].toString()+" dollars each"),

                        ],
                      )
                      )
                  );
                },
              ),
              new Text("Total: \$"+widget.total.toString()),
              new FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Checkout(destination: widget.destination, total: widget.total.toString(), location: widget.store ),
                    ));
                  },
                  color: Colors.blue,
                  child: Text(
                      "Order"))
            ],
          ),
        ),)
      ,
    );
  }


}
