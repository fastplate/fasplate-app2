
import 'package:flutter/material.dart';
import 'global.dart';
import 'dart:convert';
import 'StoreDetails.dart';
import 'data.dart' as datafile;


Future<List<Store>> fetchPost() async {



    Store.fromJson(json.decode(datafile.dataString));

    return list;

}


class StoreList extends StatefulWidget {
  StoreList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  StoreListState createState() => StoreListState();
}

class StoreListState extends State<StoreList> {

  final Future<List<Store>> post = fetchPost();
  int counter = 0;
  var name = "Resnik Cafe";
  var time = "8:00 A.M. - 2:00 P.M.";
  var price = "Expensive";
  var distance = "0.3 Miles";

  var name2 = "Tepper";
  var time2 = "11:00 A.M. - 3 P.M.";
  var price2 = "Cheap";
  var distance2 = "0.5 Miles";
  var currentLocation = <String, double>{};
  TextEditingController dest = new TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Center(
      child: FutureBuilder<List<Store>>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return Column(

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: new TextField(
                  controller: dest,
                    decoration: InputDecoration(
                      labelText: 'Delivery Destination',
                    )
                )
            ),
                new Expanded(
          child: new ListView.builder(
                itemCount: listNum,
                itemBuilder: (context, index) {
                  return new Container (
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StoreDetails(destination: dest.text, ste: snapshot.data[index], length: snapshot.data.length,)),
                        );
                      },
                      child: new Card (
                        color: Colors.blue,


                        child: new Container(
                  width: MediaQuery.of(context).size.width,
                        child: new Column(
                            mainAxisSize: MainAxisSize.min,


                            children: <Widget>[

                              new Text ((snapshot.data[index].name),
                                style: new TextStyle (fontWeight: FontWeight.bold),),
                              new Text (snapshot.data[index].type),
                              new Text (snapshot.data[index].price),
                              new Text (snapshot.data[index].location),
                              /*FlatButton(
                                  color: Colors.blue,
                                  child: new Text ("Go"),
                                  onPressed: () {
                                    counter += 1;
                                    setState(() {}

                                    );
                                  })*/
                            ]

                        ),
                      )
                      )), alignment: Alignment.center);
                }
           )
                )
           ]);





         return Text(snapshot.data.toString());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      )
    );

        }

}
