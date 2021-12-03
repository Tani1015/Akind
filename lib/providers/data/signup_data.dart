import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Gender{
  fullname,
  Email,
  password,
  confirmpassword,
  phone
}

class SignUp_Product extends GetxController{

  final Color enabled;
  final Color enabledtxt;
  final Color background;
  final Color deaible;
  RxBool password = true.obs;
  RxBool confpassword = true.obs;
  Gender? selected;

  SignUp_Product({
    this.enabled = Colors.blueGrey,
    this.enabledtxt = Colors.white,
    this.background = Colors.grey,
    this.deaible = Colors.black,
  });

  void nameselect() {
    this.selected = Gender.fullname;
    update();
  }

  void phoneselect() {
    this.selected = Gender.phone;
    update();
  }


  void emailselect() {
    this.selected = Gender.Email;
    update();
  }

  void passselect() {
    this.selected = Gender.password;
    update();
  }

  void confpassselect() {
    this.selected = Gender.confirmpassword;
    update();
  }



}