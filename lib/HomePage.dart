
import 'dart:html';

import 'package:audio_app/appColor.dart' as AppColors;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.menu1Color,
      child: const SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  ImageIcon(AssetImage("menu.png"), size: 24, color: Colors.black)
                ],
              ),
            ],
          ),
         ),
      ),
    );
  }
}