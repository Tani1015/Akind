import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendCard{
  String? description;
  String? imgurl;

  RecommendCard({
    this.description,
    this.imgurl
  });

  RecommendCard.fromMap(DocumentSnapshot data){
    this.description = data["description"];
    this.imgurl = data["imgurl"];
  }
}