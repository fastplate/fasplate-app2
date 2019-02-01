library boiler_plate.global;
import 'dart:convert';


List<Store> list = new List();
int listNum = 0;

class Store {
  String name;
  String type;
  String price;
  String location;
  String id;
  List<dynamic> menu;
  List<dynamic> prices;



  Store({this.name, this.type, this.price, this.location, this.id, this.menu, this.prices});

  factory Store.fromJson(Map<String, dynamic> json) {
    int len = json['length'];
    print(len);
    listNum = len;
    for(int i = 0; i<len; i++){
      list.add(Store(
          name: json['stores'][i]['name'],
      type:  json['stores'][i]['type'],
      price:  json['stores'][i]['price'],
      location:  json['stores'][i]['location'],
          id:  json['stores'][i]['id'],
        menu:  json['stores'][i]['menu'],
          prices:  json['stores'][i]['prices']
      ));
      print("sdsd");

      }
      return list[0];

  }





}
