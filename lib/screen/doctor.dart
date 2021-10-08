import 'package:flutter/material.dart';
import 'package:smartdoc/screen/navbar.dart';

class Doctor extends StatefulWidget {
  final Map<String, dynamic> person; // รับค่า person เป็น parameter

  const Doctor({Key? key, required this.person})
      : super(key: key); // ระบุว่าจำเป็นต้องมี person

  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียด'),
        leading: IconButton( // ให้เริ่มซ้ายบน
          icon: Icon(Icons.arrow_back, color: Colors.white), // เรียกใช้ icon และสามารถกำหนดสีได้
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.green])),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ให้กล่องเริ่มตรงซ้าย
              children: [
                Center(child: _doctorContainer('${widget.person["imgName"]}')), // เอาจาก imgName จาก constructor มาแสดงผล
                Text('ชื่อ: ${widget.person["title"]}', // เอาจาก title จาก constructor มาแสดงผล
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('รับรักษาผู้ป่วย: ${widget.person["subTitle"]}', // เอาจาก subTitle จาก constructor มาแสดงผล
                    style: TextStyle(fontSize: 16)),
                Text('สถานที่ปฏิบัติงาน: ${widget.person["location"]}', // เอาจาก location จาก constructor มาแสดงผล
                    style: TextStyle(fontSize: 16)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3, // กำหนดความกว้าง 30% ของขนาดจอ
                  child: Center(
                    child: Text('ยังไม่มีรายการนัดหมาย',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Container _doctorContainer(String imgName) { // สร้าง function เพื่อแสดงผล docterContainer
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    width: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กึ่งกลาง
      children: [
        Image.asset(
          'assets/images/$imgName',
          height: 200,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
