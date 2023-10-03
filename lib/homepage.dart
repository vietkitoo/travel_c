import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 300,
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
                          width: 290,
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
                                onTap: (){
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )
                            ),
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
                        height: 220,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
