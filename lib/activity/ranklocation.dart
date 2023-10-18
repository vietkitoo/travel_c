import 'package:flutter/material.dart';

class RankLocation {
  final String name;
  final String imageUrl;
  final Color color;
  final Color borderColor;
  final String url;

  RankLocation({required this.name, required this.imageUrl, required this.color, required this.borderColor, required this.url});
}

List<RankLocation> getRankLocations() {
  return [
    RankLocation(
      name: 'Đà Nẵng',
      imageUrl: 'assets/images/danang.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.yellowAccent,
      url: 'https://en.wikipedia.org/wiki/Da_Nang',
    ),
    RankLocation(
      name: 'Vịnh Hạ Long',
      imageUrl: 'assets/images/vinhhalong.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.blueGrey,
      url: 'https://en.wikipedia.org/wiki/H%E1%BA%A1_Long_Bay',
    ),
    RankLocation(
      name: 'Vũng Tàu',
      imageUrl: 'assets/images/vungtau.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.deepOrange,
      url: 'https://en.wikipedia.org/wiki/V%C5%A9ng_T%C3%A0u',
    ),
    RankLocation(
      name: 'Hà Nội',
      imageUrl: 'assets/images/hanoi.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.blue,
      url: 'https://vi.wikipedia.org/wiki/H%C3%A0_N%E1%BB%99i',
    ),
    RankLocation(
      name: 'Cao Bằng',
      imageUrl: 'assets/images/caobang.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.blue,
      url: 'https://vi.wikipedia.org/wiki/Cao_B%E1%BA%B1ng',
    ),
    // Thêm các địa điểm khác vào đây
  ];
}