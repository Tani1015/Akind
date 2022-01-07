import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ListingController extends GetxController{
  late File file;

  void gallery() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final file = File(pickedFile!.path);
  }

  void camera() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    final file = File(pickedFile!.path);
  }
}