import 'dart:io';

import 'package:akindo/providers/controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ListingController extends GetxController{

  File? file;
  String? imgname;
  //dropdownbuttom カテゴリー
  final List menu = [
    'コンサバ',
    'カジュアル',
    'フェミニン',
    'モード'
  ];
  final List sexmenu = [
    'レディース',
    'メンズ',
    'ウィメンズ'
  ];

  final selected = "カジュアル".obs;
  final sexselected = "レディース".obs;
  TextEditingController  Itemname = TextEditingController();
  TextEditingController  Price = TextEditingController();
  TextEditingController  description = TextEditingController();
  late var uid;

  void onInit() {
    getID();
  }

  void getID(){
    final currentuser = FirebaseAuth.instance.currentUser;
    this.uid = currentuser!.uid;
  }

  void senditems() async{
    Map<String,dynamic> Itemdata = {
      "itemname": Itemname.text,
      "category": selected.value,
      "sex" : sexselected.value,
      "price": Price.text,
      "description": description.text,
      "itemimg": imgname,
      "id": uid,
      "createdAt": DateTime.now()
    };
    await FirebaseFirestore.instance.collection("items").doc().set(Itemdata);
  }

  Future<void> uploaditemFiles() async{
    final FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("itemimg");
    UploadTask task = ref.child(this.imgname!).putFile(this.file!);
    try{
      await task;
    }catch(FirebaseException){
      //エラー処理
    }
  }

  void gallery() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    this.file = File(pickedFile!.path);
    imgname = path.basename(pickedFile.path);
    Get.toNamed("/ListingItem");
  }

  void camera() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.file = File(pickedFile!.path);
    imgname = path.basename(pickedFile.path);
    Get.toNamed("/ListingItem");
  }

  void setSelected(String value){
    selected.value = value;
  }

  void sexSelected(String sexvalue){
    sexselected.value = sexvalue;
  }



}