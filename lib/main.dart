import 'package:flutter/material.dart';
import 'package:audio_app/appColor.dart' as AppColors;

void main(){
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.background,
      home:const Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(AssetImage("assets/menu.png"), size: 24, color: Colors.black),
                  Row(
                    children: [
                      Icon(Icons.search),
                      Icon(Icons.notifications)
                    ],
                  ),
                ],
              ),
            ],
          ),
         ),
    ),
  );
}