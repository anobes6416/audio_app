import 'package:flutter/material.dart';
import 'package:audio_app/appColor.dart' as AppColors;

void main(){
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.background,
      home: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20,40,20,0),
                 child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(AssetImage("assets/menu.png"), size: 45, color: Colors.black),
                  Row(
                    children: [
                      Icon(Icons.search),
                      Icon(Icons.notifications)
                    ],
                  ),  
                ],
               ),
              ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Popular Books",
                    style: TextStyle(fontSize: 30),
                    ),
                ),
              ],
            ),
           Container(
            height: 180,
            child: Stack(
              children: [
                Positioned(
                  left: -20,
                  top: 0,
                  right: 0,
                  bottom: 0,

                  child: Container(
              height: 150,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8), 
                itemCount: 5,
                itemBuilder: (_, i){
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/sweetmess.jpeg"),
                        fit: BoxFit.fill,
                        ),
                    ),
                  );
                },
              ),
            ), 
                  ),
              ],
            ),
           ),
          
            ],
          ),
         ),
    ),
  );
}