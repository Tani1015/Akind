import 'package:akindo/providers/controller/listing_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListingItemPage extends GetWidget<ListingController>{

  Widget build(BuildContext context){

    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            SizedBox(height: height * 0.1),
            Container(
              width: weight * 0.8,
              height: height * 0.3,
              child: controller.file == null
                  ? Text('No image')
                  : Image.file(controller.file!),
            ),
              SizedBox(height: height * 0.01),
              Container(
                color: Color.fromARGB(9, 0, 0, 0),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "名前を入力してください"
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Obx( () => DropdownButton(
                    hint: Text('カテゴリー'),
                    onChanged: (newValue) {
                      String newvalue = newValue.toString();
                      controller.setSelected(newvalue);
                    },
                    value: controller.selected.value,
                    items: controller.menu.map((selectedType) {
                      return DropdownMenuItem(
                            child: new Text(selectedType),
                          value: selectedType,
                        );
                      }).toList(),
                    )
                  ),
                ])
              )
          ],
        )
      ),
    );
  }
}