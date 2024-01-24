import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String url;

  DetailScreen({required this.name, required this.imageUrl, required this.url});

  static String generateContent(String name) {
    switch (name) {
      case 'Đà Nẵng':
        return 'Đà Nẵng là một trong năm thành phố trực thuộc trung ương của Việt Nam, nằm tại vùng Duyên hải Nam Trung Bộ. Đây là thành phố trung tâm và lớn nhất miền Trung Việt Nam, đóng vai trò là hạt nhân quan trọng của Vùng kinh tế trọng điểm miền Trung. Đà Nẵng hiện là đô thị loại I, là thành phố trung tâm cấp vùng và cấp quốc gia. \n Đà Nẵng là một thành phố có nhiều tiềm năng để phát triển du lịch, là trung tâm du lịch lớn hàng đầu của Việt Nam. Phía bắc thành phố được bao bọc bởi núi cao với đèo Hải Vân được mệnh danh là "Thiên hạ đệ nhất hùng quan". Phía tây là Khu nghỉ dưỡng Sun World Bà Nà Hills nằm ở độ cao trên 1.400m với hệ thống 8 tuyến cáp treo có tổng công suất phục vụ 9.500 khách/giờ, tuyến cáp treo Thác Tóc Tiên - Indochine đạt bốn kỷ lục thế giới (Cáp treo một dây dài nhất thế giới: 5,771.61m; Độ chênh giữa ga đi và ga đến cao nhất thế giới: 1,368.93m; Chiều dài một sợi cáp không nối dài nhất thế giới: 11,587m; Độ nặng cuộn cáp nặng nhất thế giới: 141.24 tấn) cùng khu vui chơi giải trí trong nhà Fantasy Park lớn nhất Đông Nam Á và khu làng Pháp lớn nhất Việt Nam, mỗi ngày khu nghỉ dưỡng Sun World Bà Nà Hills phục vụ hơn 30.000 lượt khách, các ngày cao điểm lên tới hơn 40.000 lượt khách.Phía đông bắc là bán đảo Sơn Trà với 400 ha rừng nguyên sinh gồm nhiều động thực vật phong phú. Phía đông nam là danh thắng Ngũ Hành Sơn. Trên địa bàn thành phố còn có một hệ thống các đình, chùa, miếu theo kiến trúc Á Đông, các nhà thờ theo kiến trúc phương Tây như Nhà thờ chính toà Đà Nẵng (Nhà thờ Con Gà),...các bảo tàng mà tiêu biểu nhất là Bảo tàng Nghệ thuật Điêu khắc Chăm. Đây là bảo tàng trưng bày hiện vật Chăm quy mô nhất ở Việt Nam. Ngoài ra thành phố còn được bao bọc bởi 3 Di sản Văn hóa Thế giới: Huế, Hội An, Mỹ Sơn. Xa hơn một chút nữa là Vườn Quốc gia Bạch Mã, và Di sản Thiên nhiên Thế giới Vườn Quốc gia Phong Nha - Kẻ Bàng. Vì thế Đà Nẵng được xem là điểm trung chuyển quan trọng trên Con đường di sản miền Trung.Ước tính tổng lượng khách đến tham quan, du lịch Đà Nẵng năm 2019 đón 8,98 triệu lượt khách, trong đó khách quốc tế đạt 3,52 triệu lượt, khách nội địa đạt 5,46 triệu lượt, tăng 22,5% so với năm 2018, tổng thu từ du lịch đạt hơn 30.971 tỷ đồng. '; // Thông tin về Đà Nẵng
      case 'Vịnh Hạ Long':
        return 'Vịnh Hạ Long là một vịnh nhỏ thuộc phần bờ tây vịnh Bắc Bộ tại khu vực biển Đông Bắc Việt Nam, bao gồm vùng biển đảo của thành phố Hạ Long thuộc tỉnh Quảng Ninh.Là trung tâm của một khu vực rộng lớn có những yếu tố ít nhiều tương đồng về địa chất, địa mạo, cảnh quan, khí hậu và văn hóa, với vịnh Bái Tử Long phía Đông Bắc và quần đảo Cát Bà phía Tây Nam, vịnh Hạ Long giới hạn trong diện tích khoảng 1.553 km² bao gồm 1.969 hòn đảo lớn nhỏ, phần lớn là đảo đá vôi, trong đó vùng lõi của vịnh có diện tích 335 km² quần tụ dày đặc 775 hòn đảo. Lịch sử kiến tạo địa chất đá vôi của vịnh đã trải qua khoảng 500 triệu năm với những hoàn cảnh cổ địa lý rất khác nhau; và quá trình tiến hóa karst đầy đủ trải qua trên 20 triệu năm với sự kết hợp các yếu tố như tầng đá vôi dày, khí hậu nóng ẩm và tiến trình nâng kiến tạo chậm chạp trên tổng thể. Sự kết hợp của môi trường, khí hậu, địa chất, địa mạo, đã khiến vịnh Hạ Long trở thành quần tụ của đa dạng sinh học bao gồm hệ sinh thái rừng kín thường xanh mưa ẩm nhiệt đới và hệ sinh thái biển và ven bờ với nhiều tiểu hệ sinh thái. 17 loài thực vật đặc hữu và khoảng 60 loài động vật đặc hữu[4] đã được phát hiện trong số hàng ngàn động, thực vật quần cư tại vịnh.Những kết quả nghiên cứu, thám sát khảo cổ học và văn hóa học cho thấy sự hiện diện của những cư dân tiền sử trên vùng vịnh Hạ Long từ khá sớm, đã tạo lập những hình thái văn hóa cổ đại tiếp nối nhau bao gồm văn hóa Soi Nhụ trong khoảng 18.000-7.000 năm trước Công Nguyên, văn hóa Cái Bèo trong 7.000-5.000 năm trước Công Nguyên và văn hóa Hạ Long cách ngày nay khoảng từ 3.500-5.000 năm. Tiến trình dựng nước và truyền thống giữ nước của dân tộc Việt Nam, trong suốt hành trình lịch sử, cũng khẳng định vị trí tiền tiêu và vị thế văn hóa của vịnh Hạ Long qua những địa danh mà tên gọi gắn với điển tích còn lưu truyền đến nay, như núi Bài Thơ, hang Đầu Gỗ, Bãi Cháy v.v. Hiện nay, vịnh Hạ Long là một khu vực phát triển năng động nhờ những điều kiện và lợi thế sẵn có như có một tiềm năng lớn về du lịch, nghiên cứu khoa học, nuôi trồng, đánh bắt thủy sản, giao thông thủy đối với khu vực vùng biển Đông Bắc Việt Nam nói riêng và miền Bắc Việt Nam nói chung.'; // Thông tin về Vịnh Hạ Long
      case 'Vũng Tàu':
        return 'Vũng Tàu là một thành phố thuộc tỉnh Bà Rịa – Vũng Tàu, vùng Đông Nam Bộ, Việt Nam. Đây là trung tâm kinh tế, tài chính, văn hóa, du lịch, giao thông - vận tải và giáo dục và là một trong những trung tâm kinh tế của vùng Đông Nam Bộ. Sở hữu nhiều bãi biển đẹp và cơ sở hạ tầng được đầu tư hoàn chỉnh, Vũng Tàu là một địa điểm du lịch nổi tiếng tại miền Nam. Ngoài ra, thành phố còn là khu vực hậu cần của ngành công nghiệp dầu khí Việt Nam. Từ ngày 2 tháng 5 năm 2012, tỉnh lỵ của tỉnh Bà Rịa – Vũng Tàu được chuyển đến thành phố Bà Rịa.[5] Thành phố Vũng Tàu được công nhận là đô thị loại I trực thuộc tỉnh đầu tiên của cả Nam Bộ. Là vùng đất mới được thành lập trong quá trình Nam tiến của người Việt, đời sống văn hoá của Vũng Tàu là sự dung hòa từ nhiều yếu tố của các vùng miền hoà quyện cùng bản sắc miền biển rất riêng của địa phương.';
      case 'Hà Nội':
        return 'Hà Nội là thủ đô, thành phố trực thuộc trung ương và là một trong hai đô thị loại đặc biệt của nước Cộng hòa xã hội chủ nghĩa Việt Nam. Đây là thành phố lớn thứ hai, có vị trí là trung tâm chính trị, văn hóa, giáo dục, một trong hai trung tâm kinh tế quan trọng tại Việt Nam. Hà Nội nằm về phía tây bắc của trung tâm vùng đồng bằng châu thổ sông Hồng, với địa hình bao gồm vùng đồng bằng trung tâm và vùng đồi núi ở phía bắc và phía tây thành phố. Với diện tích 3.359,82 km², và dân số 8,4 triệu người, Hà Nội là thành phố trực thuộc trung ương có diện tích lớn nhất Việt Nam, đồng thời cũng là thành phố đông dân thứ hai và có mật độ dân số cao thứ hai trong 63 đơn vị hành chính cấp tỉnh của Việt Nam, nhưng phân bố dân số không đồng đều. Hà Nội có 30 đơn vị hành chính cấp huyện, gồm 12 quận, 17 huyện và 1 thị xã.';
      case 'Cao Bằng':
        return 'Cao Bằng có núi, rừng, sông, suối trải dài hùng vĩ, bao la, thiên nhiên còn nhiều nét hoang sơ, nguyên sinh.Khu vực thác Bản Giốc và động Ngườm Ngao tại huyện Trùng Khánh là một thắng cảnh đẹp. Thác nằm trên dòng chảy của sông Quây Sơn, được ca ngợi là một trong những thác nước đẹp nhất trong khu vực và trên thế giới. Động Ngườm Ngao (dịch theo tiếng địa phương là hang hổ) là thế giới của nhũ đá thiên nhiên gồm hàng nghìn hình khối khác nhau, có cái như đụn gạo, đụn vàng, đụn bạc, hình voi, rồng, hổ báo, mây trời, cây cối, hoa lá, chim muông, các khe suối ngầm róc rách mát rượi. Nơi đây đã hình thành điểm du lịch hấp dẫn, thu hút các du khách đến từ khắp nơi trong và ngoài nước đến thưởng ngoạn.Ngoài ra phải kể đến hồ núi Thang Hen ở huyện Quảng Hòa, núi Phia Oắc ở huyện Nguyên Bình.';
        default:
        return 'Không có thông tin cho đối tượng này.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết $name'),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(generateContent(name)), // Sử dụng generateContent
            ),
            ElevatedButton(
              child: Text('Xem trang Wikipedia', style: TextStyle(color: Colors.black),),
              onPressed: () async {
                final url = this.url;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Không thể mở liên kết $url';
                }
              },
              style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
              ),
          ],
        ),
      ),
    );
  }
}
