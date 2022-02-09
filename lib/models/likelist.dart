import 'package:cloud_firestore/cloud_firestore.dart';

class Likelist {
  String? postid;
  Timestamp? createdAt;

  Likelist({
    this.postid,
    this.createdAt
  });

  Likelist.fromMap(Map<String, dynamic> data){
    this.postid = data["like_postid"];
    this.createdAt = data["createdAt"];
  }
}