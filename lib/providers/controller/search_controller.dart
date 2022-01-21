import 'package:akindo/models/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with SingleGetTickerProviderMixin{

  RxList<ItemCard> searchList = RxList<ItemCard>([]);
  String? imgdl;

  void onInit() {
    super.onInit();
    searchList.bindStream(getItems());
  }

  Stream<List<ItemCard>> getItems() {
      return FirebaseFirestore.instance.collection("items").orderBy("createdAt", descending: true).snapshots().map((query) =>
          query.docs.map((item) => ItemCard.fromMap(item.data())).toList());
          }

  // void getSearch(String search) async{
  //   FirebaseFirestore.instance.collection("items")
  //       .where('itemname', isEqualTo: search)
  //       .snapshots().map((data) =>
  //       data.docs.map((searchitem) => ItemCard.fromMap(searchitem)).toList()
  //   );
  //   searchList.refresh();
  // }

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

}