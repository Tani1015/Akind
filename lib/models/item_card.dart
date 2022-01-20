import 'package:cloud_firestore/cloud_firestore.dart';

class ItemCard{
  String? category;
  String? description;
  String? itemimg;
  String? uid;
  String? itemname;
  String? price;
  String? sex;

  ItemCard({
    this.category,
    this.description,
    this.itemimg,
    this.uid,
    this.itemname,
    this.price,
    this.sex
  });

  ItemCard.fromMap(DocumentSnapshot data){
    this.category = data["category"];
    this.description = data["description"];
    this.itemimg = data["itemimg"];
    this.uid = data["id"];
    this.itemname = data["itemname"];
    this.price = data["price"];
    this.sex = data["sex"];
  }
}