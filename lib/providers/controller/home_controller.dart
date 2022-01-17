import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/models/users.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var uid;
  late CollectionReference collectionReference;

  RxList<Users> userlist = RxList<Users>([]);

  void onInit() {
    super.onInit();
    collectionReference = firestore.collection("Users");
    getID();
    userlist.bindStream(getAllUsers());
  }

  Stream<List<Users>> getAllUsers() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => Users.fromMap(item)).toList());

  void getID(){
    final currentuser = FirebaseAuth.instance.currentUser;
    this.uid = currentuser!.uid;
  }
}
