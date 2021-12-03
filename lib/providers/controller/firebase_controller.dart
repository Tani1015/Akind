import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//クラスインポート
class FirebaseController extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value!.email;

  void onInit(){
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String fullname,String email,String password) async{
    CollectionReference reference = FirebaseFirestore.instance.collection("Users");

    Map<String,String> userdata ={
      "Full Name": fullname,
      "Email": email
    };

    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      reference.add(userdata).then((value) => Get.offAllNamed("/Login"));
    }).catchError((onError) =>
        Get.snackbar("アカウントが作成できませんでした",onError.message),
    );
  }

  void login(String email, String password) async {

    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAllNamed("/Routes")).
      catchError((onError) => Get.snackbar("ログインできませんでした", onError.message));
  }

  void signout() async{
    await _auth.signOut().then((value) => Get.offAllNamed("/Login"));
  }

}