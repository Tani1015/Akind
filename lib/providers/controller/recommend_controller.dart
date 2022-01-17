import 'package:akindo/models/recommend_card.dart';
import 'package:akindo/providers/controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RecommendController extends GetxController{
  late CollectionReference collectionReference;
  final currentuser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late var uid;
  RxList<RecommendCard> cardlist = RxList<RecommendCard>([]);

  void onInit(){
    super.onInit();
    collectionReference = firestore.collection("Users");
    getID();
    cardlist.bindStream(getPosts());
  }

  void getID(){
    if(currentuser != null){
      this.uid = currentuser!.uid;
    }
  }

  void sendpost(String description,String imageurl) async{
    Map<String,String> postdata = {
      "description": description,
      "imgurl": imageurl,
      "id": uid
    };

    await FirebaseFirestore.instance.collection("posts").doc().set(postdata);
  }

  Stream<List<RecommendCard>> getPosts() =>
      FirebaseFirestore.instance.collection("posts").snapshots().map((query) =>
        query.docs.map((item) => RecommendCard.fromMap(item)).toList());

}