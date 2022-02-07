import 'package:cloud_firestore/cloud_firestore.dart';

class ItemCard{
  String? category;
  String? description;
  String? itemimg;
  String? uid;
  String? username;
  String? itemname;
  String? price;
  String? sex;
  Timestamp? createdAt;

  ItemCard({
    this.category,
    this.description,
    this.itemimg,
    this.uid,
    this.username,
    this.itemname,
    this.price,
    this.sex,
    this.createdAt,
  });

  ItemCard.fromMap(Map<String, dynamic> data){
    this.category = data["category"];
    this.description = data["description"];
    this.itemimg = data["itemimg"];
    this.uid = data["id"];
    this.username = data["username"];
    this.itemname = data["itemname"];
    this.price = data["price"];
    this.sex = data["sex"];
    this.createdAt = data["createdAt"];
  }
}