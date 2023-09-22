
import 'dart:convert';
import 'dart:html';

import 'package:audio_app/appColor.dart' as AppColors;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late List popularBooks;
        ReadData() async{
          await DefaultAssetBundle.of(context).loadString("json/popularBooks.json").then((s){
            setState((){
              popularBooks=json.decode(s);
            });
          });
        }
        @override
        void initState(){
          super.initState();
          ReadData();
        }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.menu1Color,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20,40,20,0),
                 child: Row(
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
              SizedBox(
                height: 20,
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
               SizedBox(
                height: 20,
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
                itemCount: popularBooks==null?0:popularBooks.length,
                itemBuilder: (_, i){
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(popularBooks[i]["img"]),
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
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:audio_app/appColor.dart' as AppColors;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Future<List<dynamic>> readData() async {
//     final String jsonString =
//         await DefaultAssetBundle.of(context).loadString("json/popularBooks.json");
//     return json.decode(jsonString);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: AppColors.menu1Color,
//         child: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ImageIcon(
//                       AssetImage("assets/menu.png"),
//                       size: 45,
//                       color: Colors.black,
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.search),
//                         Icon(Icons.notifications),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 20),
//                     child: Text(
//                       "Popular Books",
//                       style: TextStyle(fontSize: 30),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               FutureBuilder<List<dynamic>>(
//                 future: readData(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final popularBooks = snapshot.data!;
//                     return Container(
//                       height: 180,
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             left: -20,
//                             top: 0,
//                             right: 0,
//                             bottom: 0,
//                             child: Container(
//                               height: 150,
//                               child: PageView.builder(
//                                 controller: PageController(viewportFraction: 0.8),
//                                 itemCount: popularBooks.length,
//                                 itemBuilder: (_, i) {
//                                   return Container(
//                                     height: 150,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       image: DecorationImage(
//                                         image: AssetImage(popularBooks[i]["img"]),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('Error loading data');
//                   } else {
//                     return CircularProgressIndicator();
//                   }
//                 },
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }