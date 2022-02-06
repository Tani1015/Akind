import 'package:akindo/providers/controller/listing_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                color: Color.fromARGB(15, 0, 0, 0),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "名前を入力してください"
                    ),
                    controller: controller.Itemname,
                  ),
                  SizedBox(height: height * 0.01),
                  Row(children: <Widget>[
                    Obx( () => DropdownButton(
                      hint: Text('カテゴリー'),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
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
                    )),
                      SizedBox(width: weight * 0.1),
                      Obx( () => DropdownButton(
                        hint: Text("性別"),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (sexnewValue){
                          String sexnewvalue = sexnewValue.toString();
                          controller.sexselected(sexnewvalue);
                        },
                        value: controller.sexselected.value,
                        items: controller.sexmenu.map((sexselectedType){
                          return DropdownMenuItem(
                              child: new Text(sexselectedType),
                            value: sexselectedType,
                          );
                        }).toList(),
                      )),
                  ]),
                    SizedBox(height: height * 0.01,),
                    Row(
                      children: <Widget>[
                        Container(
                          width:  weight * 0.3,
                          child: TextField(
                            controller: controller.Price,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                                hintText: "Price"
                            ),
                          ),
                        ),
                        Text("円　/　週")
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: height * 0.1,
                      child: TextField(
                        controller: controller.description,
                        decoration: InputDecoration(
                            hintText: "商品の説明を入力してください"
                        ),
                      ),
                    ),
                  ]),
              ),
            SizedBox(height: height * 0.12),
            Container(
                child: TextButton(
                  onPressed: () {
                    //出品
                    controller.senditems();
                    controller.sendmyitems();
                    controller.uploaditemFiles();
                    Get.offAllNamed("/Routes");
                  },
                  child: Text("出品する",style: TextStyle(
                      fontFamily: "Font3",
                      color: Colors.white,letterSpacing: 0.5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical:  10.0, horizontal: 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                  ),
                )
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.sepword(controller.Itemname.text);
          print(controller.searchkey);
        },
      ),
    );
  }
}