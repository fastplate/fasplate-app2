
import 'package:flutter/material.dart';
import 'global.dart';
import 'OrderConfirm.dart';
import 'dart:convert';
import 'global.dart';

class StoreDetails extends StatefulWidget {
  final Store ste;
  final String title;
  final String destination;

  final int length;

  StoreDetails({Key key, this.title, this.destination, @required this.ste,  @required this.length}) : super(key: key);


  @override
  StoreDetailsState createState() => StoreDetailsState();
}

class StoreDetailsState extends State<StoreDetails> {

  List<int> j = new List();
  int total = 0;


  @override
  Widget build(BuildContext context) {
    while(j.length < widget.ste.menu.length){
      j.add(0);
    }
    print(widget.ste);
    return MaterialApp(
      title: widget.ste.name,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: (){Navigator.pop(context,true);}
            ),
            title:  Text(widget.ste.name)),
        body: new SafeArea(

      child: Column(

      mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          new Card(
              child: Container(
                  child: new Column(
                    children: <Widget>[
                      new Text ((widget.ste.name),
                        style: new TextStyle (fontWeight: FontWeight.bold),),
                      new Text (widget.ste.type),
                      new Text (widget.ste.price),
                      new Text (widget.ste.location),
                    ],
                  ),
                  color: Colors.blue,
                width: MediaQuery.of(context).size.width,

              )

          ),
          new ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.ste.menu.length,
            itemBuilder: (context, index) {
              return Card(
                child: new Row(
                  children: <Widget>[
                    Text(widget.ste.menu[index]+": "+widget.ste.prices[index].toString()+" dollars each"),


                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          if(j[index]==null || j[index] == 0){
                            j[index] = 0;

                          }
                          else {
                            j[index] = j[index]-1;
                            total = total - widget.ste.prices[index];
                          }
                        });
                        setState(() {

                        });
                      },
                    ),
                    Text(j[index].toString()),

                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        setState(() {
                          print(j.length);
                          if(j[index]==null){
                            j[index] = 1;
                            total = total + widget.ste.prices[index];
                          }
                          else {
                            j[index] = j[index]+1;
                            total = total + widget.ste.prices[index];
                          }
                        });
                      },
                    ),

                  ],
                )
              );
            },
          ),
          new FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderConfirm(destination: widget.destination, store: widget.ste.name, items: widget.ste.menu, nums: j, prices: widget.ste.prices, total:total)),
                );                },
              color: Colors.blue,
              child: Text(
                "\$"+total.toString()
              ))
        ],
      ),
    ),)
    ,
    );
  }


}
