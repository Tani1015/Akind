import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendCard{
  String? description;
  String? imgurl;
  String? id;

  RecommendCard({
    this.description,
    this.imgurl,
    this.id
  });

  RecommendCard.fromMap(DocumentSnapshot data){
    this.description = data["description"];
    this.imgurl = data["imgurl"];
    this.id = data["id"];
  }
}