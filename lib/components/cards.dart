import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  Cards(
      {this.title = '', this.subTitle = '', this.imgName = ''}); // constructor

  // กำหนดตัวแปรเพื่อส่งค่าและรับค่า
  final String title;
  final String subTitle;
  final String imgName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0), // ดันขอบการ์ดทุกด้านเข้ามา
      color: Colors.white30, // สีพื้นหลังการ์ด
      child: InkWell(
        //
        onTap: () {}, // เมื่อกดการ์ด
        splashColor: Colors.white, // กดปุ่มจะกระพริบสี
        child: Center(
          // จัดให้อยู่กึ่งกลางทั้งแนวตั้งแนวนอน
          child: Column(
            mainAxisSize: MainAxisSize.min, // จัดแกนหลักตรงกับกล่อง
            children: [
              Image.asset(
                // เรียกใช้รูปภาพจากโฟลเดอร์
                imgName,
                height: 80, // ความสูงของรูปภาพ
              ),
              SizedBox(
                // ใส่ SizedBox เพื่อให้รูปไม่ชิดกับข้อมูล
                height: 10, // ความสูงของ SizedBox
              ),
              Text(
                title,
                style: TextStyle( // ตกแต่งฟอนต์
                    fontSize: 16.0, // ขนาดของฟอนต์
                    fontWeight: FontWeight.bold, // กำหนดความหนาของฟอนต์
                    color: Colors.black),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
