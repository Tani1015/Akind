import 'package:akindo/screens/post_page.dart';
import 'package:flutter/material.dart';

class SharePageState extends StatelessWidget{
@override
Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color.fromRGBO(235,177,243,1),
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(150,100,150,1),
      //   title: Text("掲示板デモ"),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.edit), onPressed: () {
      //         Navigator.of(context).push(MaterialPageRoute(builder: (context){
      //           return PostPage();
      //       }));
      //     },
      //     ),
      //   ],
      // ),
      body: Center(
        child: Text(
            "お気に入りのコーデをシェアしよう！",
          style: TextStyle(
              fontFamily: "font3",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(87, 93, 107, 1)
          ),
        ),
      ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Color.fromRGBO(150,100,150,1),
       child: Icon(Icons.edit),
         onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PostPage();
          }));
     }),
   );
  }
}