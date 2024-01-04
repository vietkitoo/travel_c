import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
                              width: 280,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                'TRAVEL_C',
                                style: GoogleFonts.lobster(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
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
                                // Thay thế nút tìm kiếm bằng nút chat
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatPage(),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 15,
                      right: 15,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CarouselSlider(
                                items: [
                                  Image.asset("assets/images/danang.jpg"),
                                  Image.asset("assets/images/vinhhalong.jpg"),
                                  Image.asset("assets/images/vungtau.jpg"),
                                  Image.asset("assets/images/caobang.jpg"),
                                ],
                                options: CarouselOptions(
                                  height: 400,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                ),
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
                height: 1,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TOP ĐỊA ĐIỂM HIỆN NAY',
                      style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 5,
                    ),
                    Container(
                      height: 450,
                      width: 390,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
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
                                      url: rankLocation
                                          .url, // Truyền đường dẫn Wikipedia
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: rankLocation.color,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    border: Border.all(
                                      color: rankLocation.borderColor,
                                      width: 1,
                                    )),
                                height: 100,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                        border: Border(
                                          right: BorderSide.none,
                                          top: BorderSide.none,
                                          bottom: BorderSide.none,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                        child: Image.asset(
                                          rankLocation.imageUrl,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      rankLocation.name,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                          );
                        },
                      ),
                    ),
                  ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
