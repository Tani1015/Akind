import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ListingController extends GetxController{

  File? file;
  //dropdownbuttom カテゴリー
  final List menu = [
    'コンサバ',
    'カジュアル',
    'フェミニン',
    'モード'
  ];
  final selected = "カジュアル".obs;

  void gallery() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    this.file = File(pickedFile!.path);
    Get.toNamed("/ListingItem");
  }

  void camera() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.file = File(pickedFile!.path);
    Get.toNamed("/ListingItem");
  }

  void setSelected(String value){
    selected.value = value;
  }
}