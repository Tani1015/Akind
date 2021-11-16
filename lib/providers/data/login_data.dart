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
  bool password;
  Gender? selected;

  Login_Product({
  this.enabled = Colors.blueGrey,
  this.enabledtxt = Colors.white,
  this.background = Colors.grey,
  this.deaible = Colors.black,
  this.password = true,
  });


  void emailselect() {
    this.selected = Gender.Email;
    update();
  }

  void passwordselect() {
    this.password = !this.password;
    update();
  }

}