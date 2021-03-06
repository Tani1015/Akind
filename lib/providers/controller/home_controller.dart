import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/models/users.dart';
import 'package:akindo/models/item_card.dart';
import 'package:akindo/models/recommend_card.dart';
import 'package:akindo/models/likelist.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var uid;
  late CollectionReference collectionReference;
  TabController? tabController;
  String? imgdl;

  final tabs = [
    Tab(text: "おすすめ",),
    Tab(text: "レンタル",),
    Tab(text: "出品",),
  ];

  RxList<Users> userlist = RxList<Users>([]);
  RxList<RecommendCard> mycardlist = RxList<RecommendCard>([]);
  RxList<ItemCard> mylistinglist = RxList<ItemCard>([]);
  RxList<ItemCard> myrentallist = RxList<ItemCard>([]);
  // RxList<Likelist> mylikelist = RxList<Likelist>([]);
  RxList mylikelist = [].obs;


  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
    collectionReference = firestore.collection("Users");
    getID();
    mycardlist.bindStream(getmyPosts());
    mylistinglist.bindStream(getmyItems());
    myrentallist.bindStream(getmyRentals());
    // mylikelist.bindStream(getmylikelist());
    getmylike();
  }

  void getID(){
    final currentuser = FirebaseAuth.instance.currentUser;
    this.uid = currentuser!.uid;
  }

  // Stream<List<Likelist>> getmylikelist() =>
  //     FirebaseFirestore.instance.collection("Users").doc(uid)
  //         .collection("like").snapshots().map((query) =>
  //         query.docs.map((item) => Likelist.fromMap(item.data())).toList());

  RxList<dynamic> getmylike(){
    FirebaseFirestore.instance.collection("Users").doc(uid)
        .collection("like").get().then((query) =>
          query.docs.forEach((doc) {
            mylikelist.add(doc.id);
          })
        );
    return mylikelist;
  }

  Future<String?> getimg(String imgurl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref().child("images").child(imgurl);
    imgdl = await imageRef.getDownloadURL();
    return imgdl;
  }

  Stream<List<RecommendCard>> getmyPosts() =>
    FirebaseFirestore.instance.collection("Users").doc(uid)
        .collection("post").orderBy("createdAt", descending: true).snapshots().map((query) =>
        query.docs.map((item) => RecommendCard.fromMap(item)).toList());

  Stream<List<ItemCard>> getmyItems() =>
      FirebaseFirestore.instance.collection("Users").doc(uid)
          .collection("items").orderBy("createdAt", descending: true).snapshots().map((query) =>
          query.docs.map((item) => ItemCard.fromMap(item.data())).toList());

  Stream<List<ItemCard>> getmyRentals() =>
      FirebaseFirestore.instance.collection("Users").doc(uid)
          .collection("rentals").orderBy("createdAt", descending: true).snapshots().map((query) =>
          query.docs.map((item) => ItemCard.fromMap(item.data())).toList());

  Future<String?> getitemimg(String imgurl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref().child("itemimg").child(imgurl);
    imgdl = await imageRef.getDownloadURL();
    return imgdl;
  }
}
