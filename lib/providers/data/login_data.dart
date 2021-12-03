import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Gender{
  Email,
  password,
}

class Login_Product extends GetxController{

  final Color enabled;
  final Color enabledtxt;
  final Color background;
  final Color deaible;
  RxBool password = true.obs;
  Gender? selected;

  Login_Product({
  this.enabled = Colors.blueGrey,
  this.enabledtxt = Colors.white,
  this.background = Colors.grey,
  this.deaible = Colors.black,
  });


  void emailselect() {
    this.selected = Gender.Email;
    update();
  }

}