import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audio_app/appColor.dart' as AppColors;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late List<dynamic> popularBooks;
  late ScrollController _scrollController;
  late TabController _tabController;
  Future<void> readData() async {
    final String jsonString =
        await DefaultAssetBundle.of(context).loadString("json/popularBooks.json");
    setState(() {
      popularBooks = json.decode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
_tabController = TabController(length: 3, vsync: this);
_scrollController = ScrollController(); 
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: 3,
    child: Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(
                  AssetImage("assets/menu.png"),
                  size: 45,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Icon(Icons.search),
                    Icon(Icons.notifications),
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
                      itemCount: popularBooks?.length ?? 0,
                      itemBuilder: (_, i) {
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
          Expanded(child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool isScroll){
              
              return[
                SliverAppBar(
                  pinned: true,
                  backgroundColor:AppColors.sliverBackround,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, left: 10),
                      child: TabBar(
                        indicatorPadding: const EdgeInsets.all(0),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: const EdgeInsets.only(right: 10),
                        controller: _tabController,
                        isScrollable: true,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 7,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),

                        tabs: [
                          Container(
                            height: 50,
                            width: 120,
                            child: Text(
                              "New",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.menu1Color,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            child: Text(
                              "New",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.menu2Color,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            child: Text(
                              "New",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.menu3Color,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                ),
                              ]
                            ),
                          ),
                        ],
                        ),
                    ),
                    ),
                ),
              ];
             },

             body: TabBarView(
              children: [
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("Context"),
                  ),
                ),
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("Context"),
                  ),
                ),
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("Context"),
                  ),
                ),
              ],
              ),
            ),
          ),
        ],
      ),
     ),
    );
  }
}