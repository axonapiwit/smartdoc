import 'package:flutter/material.dart';
import 'package:smartdoc/screen/booked.dart';
import 'package:smartdoc/screen/doctor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var doctors = [ // mock ข้อมูลเป็น List ไว้เพื่อนำไปใช้งานได้สะดวกขึ้น
    {
      'title': 'นพ.วีรยุทธ ภาคภูมิ',
      'imgName': 'male-doctor3.png',
      'subTitle': 'มะเร็ง',
      'location': 'ตึกศิริราช ชั้น 1 ห้อง 101',
    },
    {
      'title': 'พญ.อัษฏา บุตรดี',
      'imgName': 'female-doctor.png',
      'subTitle': 'ความดันโลหิตสูง',
      'location': 'ตึกศิริราช ชั้น 1 ห้อง 102',
    },
    {
      'title': 'นพ.ปวเรศ เมืองแก้ว',
      'imgName': 'male-doctor2.png',
      'subTitle': 'เบาหวาน',
      'location': 'ตึกราชมงคล ชั้น 1 ห้อง 101',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea( // กำหนดขอบเขตให้ไม่ออกนอก
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView( // ให้ตัวหน้าจอ Scroll ได้
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    child: Column(
                  children: [
                    Container( // อันนี้คือโปรไฟล์มุมขวาบน
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container( // กล่องโปรไฟล์
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration( // ตกแต่งตัวกล่องนี้
                                shape: BoxShape.circle, // กำหนดให้กล่องนี้เป็นวงกลม
                                gradient: LinearGradient(colors: <Color>[ // กำหนดสีพื้นหลังเป็น gradient เพื่อไล่ระดับสี
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ])),
                            child: Center( // ให้ตัวอักษรอยู่ตรงกลางกล่อง
                              child: Text(
                                'A',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ยินดีต้อนรับ',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Booked(), // ดูจำนวนคิวที่มีการจองทั้งหมดในขณะนี้
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'การนัดหมาย',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection:
                                  Axis.horizontal, // scroll ตามแนวนอน
                              children: [
                                for (var d in doctors) // ลูปตามข้อมูลของ data ข้างบนเพื่อแสดงผล
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Doctor(
                                            person: d,
                                          ),
                                        ),
                                      );
                                    },
                                    child: _doctorContainer('${d["imgName"]}',
                                        '${d["title"]}', '${d["subTitle"]}'), // ส่งค่าให้ function doctorContainer
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container _doctorContainer(String imgName, String title, String subTitle) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20), // ดันขอบเข้ามาในแนวนอน
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset( 
          'assets/images/$imgName', // เรียกใช้งานรูปจากโฟลเดอร์
          height: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '$subTitle',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Text(
          '$title',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
