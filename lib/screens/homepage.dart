import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_c/activity/ranklocation.dart';
import 'package:travel_c/screens/chatpage.dart';
import 'package:travel_c/screens/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(110),
                            bottomRight: Radius.circular(110),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 120),
                              width: 330,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search...",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 5,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 120),
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0x647A7676),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 15,
                      right: 15,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AnotherCarousel(
                                images: const [
                                  AssetImage("assets/images/danang.jpg"),
                                  AssetImage("assets/images/vinhhalong.jpg"),
                                  AssetImage("assets/images/vungtau.jpg"),
                                ],
                                dotSize: 4,
                                indicatorBgPadding: 5,
                                autoplayDuration: const Duration(seconds: 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  'TOP ĐỊA ĐIỂM HIỆN NAY',
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  height: 400,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: ListView.builder(
                    itemCount: getRankLocations().length,
                    itemBuilder: (context, index) {
                      final rankLocation = getRankLocations()[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  name: rankLocation.name,
                                  imageUrl: rankLocation.imageUrl,
                                  url: rankLocation.url, // Truyền đường dẫn Wikipedia
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: rankLocation.color,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: rankLocation.borderColor,
                                  width: 4,
                                )),
                            height: 100,
                            child: Row(
                              children: [
                                Image.asset(
                                  rankLocation.imageUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  rankLocation.name,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ]),
            ],
          ),
          Positioned(
            bottom: 16, // Vị trí ban đầu của bong bóng chat theo trục dọc
            right: 16, // Vị trí ban đầu của bong bóng chat theo trục ngang
            child: FloatingActionButton(
              onPressed: () {
                // Xử lý khi bong bóng chat được nhấn
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              },
              child: Icon(Icons.chat),
              backgroundColor: Colors.blue, // Màu nền của bong bóng chat
            ),
          ),
        ],
      ),
    );
  }
}
