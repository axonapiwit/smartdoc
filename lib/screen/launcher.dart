import 'package:flutter/material.dart';
import 'package:smartdoc/screen/navbar.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background ส่วนบน
      body: SafeArea(
        child: Stack(
          // Stack ช่วยทำให้สามารถนำ Widget มาซ้อน Widget ได้
          children: [
            Container(
                width: MediaQuery.of(context).size.width, // กำหนดความกว้างเท่าขนาดจอ
                height: MediaQuery.of(context).size.height, // กำหนดความสูงเท่าขนาดจอ
                child: CustomPaint(
                  painter: PathPainter(), // background
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // จัดตำแหน่งให้กล่องเริ่มจากซ้าย
                children: [
                  Text( // ชื่อแอปพลิเคชัน
                    'SmartDoc',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // กำหนดขนาดและความหนาของฟอนต์
                  ),
                  Text( // คำอธิบายแอปพลิเคชัน
                    'An application that will help you book an appointment anywhere.',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Positioned( // การจัดตำแหน่งของ Stack จะใช้ตัว Postioned หรือ Align เข้ามาช่วยในการวาง Widget
                bottom: MediaQuery.of(context).size.height * 0.15, // กำหนดความสูงจากข้างล่าง 15% ของขนาดจอ
                child: Container(
                  width: MediaQuery.of(context).size.width, // กำหนดความกว้างเท่าขนาดจอ
                  child: Image.asset('assets/images/bg2.png'), // เรียกใช้รูปจากโฟลเดอร์
                )),
            Positioned( // ปุ่มกดเริ่มต้นการใช้งาน
                right: 0, // จัดตำแหน่งให้ชิดขวา
                bottom: 0, // จัดตำแหน่งให้ชิดล่าง
                child: InkWell(
                  child: Container(
                    height: 80, // กำหนดความสูง
                    width: 200, // กำหนดความกว้าง
                    decoration: BoxDecoration( 
                        gradient: LinearGradient( // ไล่ระดับสี
                            begin: Alignment.bottomRight, // เริ่มไล่ระดับสีจากขวา
                            end: Alignment.bottomCenter, // ไล่ระดับสีจนถึงตรงกลาง
                            colors: [Colors.white, Colors.green]),
                        borderRadius: BorderRadius.only( // ขอบปุ่ม
                          topLeft: Radius.circular(25), // ให้ขอบบนซ้ายมน
                        )),
                    child: Center(
                      child: Text(
                        'Get Startd',
                        style: TextStyle(
                            color: Colors.white, // สีของตัวอักษร
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () { // เมื่อกดปุ่ม
                    Navigator.push( // จะเปลี่ยนหน้า
                      context,
                      MaterialPageRoute( // ไปยังหน้า Navbar
                        builder: (context) => NavBar(),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  // สร้าง class background ที่เป็นคลื่น
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue.shade100; // กำหนดสีสันคลื่น
    paint.style = PaintingStyle.fill; // เติมสีลงไป
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.40,
        size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.72, size.height * 0.8,
        size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.8, size.width, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelagate) {
    return true;
  }
}
