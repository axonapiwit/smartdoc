import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartdoc/notifilers/user_notifier.dart';
import 'package:smartdoc/screen/navbar.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.green])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('ประวัติการจอง'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavBar()),
              ),
            ),
          ),
          body: SingleChildScrollView( // ให้หน้าจอ scroll ได้
            child: Container(
              margin: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  Selector<UserNotifier, int>(
                    selector: (context, user) => user.userGetServ, // เข้าไป notifier เพื่อเลือกว่าจะใช้งาน function อันไหน
                    builder: (context, getServ, child) { // ตั้งชื่อเล่นให้ userGetServ เพื่อใช้งานได้ง่ายขึ้น
                      return Text(
                        'จำนวนครั้งที่รับบริการ : ' +
                            getServ.toString(), // เปลี่ยนค่าจำนวนบริการทั้งหมด จากตัวเลขเป็นข้อความแทน
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ListView.builder(
                      // แสดงผลในรูปแบบ List
                      shrinkWrap: true,
                      primary: false, // ปิด Scroll ของ Listview
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'คิวที่ : ' +
                                    (index + 1) // ให้ index +1 เพื่อจะนับคิวการจอง
                                        .toString(), // แสดงคิวการจองออกมาเป็นข้อความ
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'เลขบัตรประชาชน : ' +
                                    userNotifier.userList[index].idCard, // ดึงข้อมูลเลขบัตรประชาชนจาก List ออกมา
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'ชื่อ-นามสกุล : ' +
                                    userNotifier.userList[index].name, // ดึงข้อมูลชื่อ-นามสกุลจาก List ออกมา
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'ประเภทการรักษา : ' +
                                    userNotifier.userList[index].treat, // ดึงข้อมูลประเภทการรักษาจาก List ออกมา
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: userNotifier.userList
                          .length, // สร้าง itemBuilder ตาม userNotifier
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
