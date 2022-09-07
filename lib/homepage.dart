import 'dart:convert';

import 'package:ebook_app/audio_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List? popularBooks;
  List? books;
  ScrollController? _scrollController;
  TabController? _tabController;

  ReadDate() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ImageIcon(
                    AssetImage("assets/images/img_282193.png"),
                    size: 25,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(Icons.notifications),
                    ],
                  )
                ],
              )),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 22, top: 5),
                child: const Text(
                  "popular books",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 20,
                  left: -25,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 180,
                    child: PageView.builder(

                        // // ignore: unrelated_type_equality_checks
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return Container(
                            height: 180,
                            margin: const EdgeInsets.only(left: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: AssetImage("img/second.jpg"),
                                    fit: BoxFit.fill)),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TabBar(
                          indicatorPadding: EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.only(right: 10),
                          controller: _tabController,
                          isScrollable: true,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: const Offset(0, 0),
                                )
                              ]),
                          tabs: [
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ]),
                              alignment: Alignment.center,
                              child: const Text(
                                "New",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ]),
                              alignment: Alignment.center,
                              child: const Text(
                                "Popular",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ]),
                              alignment: Alignment.center,
                              child: const Text(
                                "Trending",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const AudioPage()));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                    image: AssetImage("img/third.jpg"),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.star,
                                        size: 24, color: Colors.amber),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontFamily: "Avenir",
                                          fontWeight: FontWeight.bold),
                                    ),


                                  ],
                                ),
                                const Text(
                                  "peace life",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Avenir",fontWeight: FontWeight.bold,fontSize: 20,
                                  ),
                                ),
                                const Text(
                                  "maryt nabil",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Avenir",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("Content"),
                  ),
                ),
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("Content"),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
