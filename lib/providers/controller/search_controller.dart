import 'package:akindo/models/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with SingleGetTickerProviderMixin{

  RxList<ItemCard> searchList = RxList<ItemCard>([]);
  String? imgdl;
  late var uid;

  void onInit() {
    super.onInit();
    getID();
    searchList.bindStream(getItems());
  }

  void getID(){
    final currentuser = FirebaseAuth.instance.currentUser;
    this.uid = currentuser!.uid;
  }

  Stream<List<ItemCard>> getItems() {
      return FirebaseFirestore.instance.collection("items").orderBy("createdAt", descending: true).snapshots().map((query) =>
          query.docs.map((item) => ItemCard.fromMap(item.data())).toList());
  }

  Future<List<ItemCard>> getsearch(String search) {
    searchList.clear();
    return FirebaseFirestore.instance.collection("items").where("itemname", isGreaterThanOrEqualTo: search).where("itemname", isLessThanOrEqualTo: "$search\uf7ff")
        .get().then((data) =>
          searchList.value = data.docs.map((searchdata) =>
              ItemCard.fromMap(searchdata.data())
          ).toList());
  }

  Future<String?> getitemimg(String imgurl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref().child("itemimg").child(imgurl);
    imgdl = await imageRef.getDownloadURL();
    return imgdl;
  }

  void sendmyrentals(int index) async{
    Map<String,dynamic> Itemdata = {
      "itemname": searchList[index].itemname,
      "username": searchList[index].username,
      "category": searchList[index].category,
      "sex" : searchList[index].sex,
      "price": searchList[index].price,
      "description": searchList[index].description,
      "itemimg": searchList[index].itemimg,
      "id": searchList[index].uid,
      "createdAt": DateTime.now(),
    };
    await FirebaseFirestore.instance.collection("Users").doc(uid).collection("rentals").doc().set(Itemdata);
  }


}