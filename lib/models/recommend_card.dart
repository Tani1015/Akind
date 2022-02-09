import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendCard{
  String? description;
  String? imgurl;
  String? id;
  String? postid;

  RecommendCard({
    this.description,
    this.imgurl,
    this.id,
    this.postid
  });

  RecommendCard.fromMap(DocumentSnapshot data){
    this.description = data["description"];
    this.imgurl = data["imgurl"];
    this.id = data["id"];
    this.postid = data["postid"];
  }
}