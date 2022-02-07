import 'package:akindo/models/item_card.dart';
import 'package:akindo/models/recommend_card.dart';
import 'package:akindo/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class RecommendController extends GetxController{
  late CollectionReference collectionReference;
  final currentuser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late var uid;
  final picker = ImagePicker();
  String? imgdl;
  RxList<RecommendCard> cardlist = RxList<RecommendCard>([]);
  RxList<Users> user = RxList<Users>([]);
  late CollectionReference userref;
  String? username;
  RxBool likebutton = false.obs;
  RxBool favoritebutton = false.obs;


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
    Map<String,dynamic> postdata = {
      "description": description,
      "imgurl": imageurl,
      "id": uid,
      "createdAt": DateTime.now()
    };

    await FirebaseFirestore.instance.collection("posts").doc().set(postdata);
  }

  void sendmypost(String description,String imageurl) async{
    Map<String,dynamic> postdata = {
      "description": description,
      "imgurl": imageurl,
      "id": uid,
      "createdAt": DateTime.now()
    };
    await FirebaseFirestore.instance.collection("Users").doc(uid).collection("post").doc().set(postdata);
  }

  Stream<List<RecommendCard>> getPosts() =>
      FirebaseFirestore.instance.collection("posts").orderBy("createdAt", descending: true).snapshots().map((query) =>
          query.docs.map((item) => RecommendCard.fromMap(item)).toList());

  Future<void> uploadFiles(String imgname,File file) async{
    final FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images");
    UploadTask task = ref.child(imgname).putFile(file);

    try{
      await task;
    }catch(FirebaseException){
      //エラー処理
    }
  }

  Future<String?> getimg(String imgurl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref().child("images").child(imgurl);
    imgdl = await imageRef.getDownloadURL();
    return imgdl;
  }
}