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
      name: 'Địa điểm 4',
      imageUrl: 'assets/images/vinhhalong.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.blue,
      url: '',
    ),
    RankLocation(
      name: 'Địa điểm 5',
      imageUrl: 'assets/images/vinhhalong.jpg', // Đặt đường dẫn hình ảnh tương ứng
      color: Colors.white,
      borderColor: Colors.blue,
      url: '',
    ),
    // Thêm các địa điểm khác vào đây
  ];
}