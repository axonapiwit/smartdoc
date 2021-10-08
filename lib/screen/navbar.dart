import 'package:flutter/material.dart';
import 'package:smartdoc/screen/home.dart';
import 'package:smartdoc/screen/input.dart';
import 'package:smartdoc/screen/list_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0; // กำหนดคือถ้าปัจจุบันที่กำลังเลือกอยู่
  List<Widget> _widgetOptions = <Widget>[ // กำหนด Bot Nav Bar ไว้แต่ละหน้าให้อยู่ใน List
    HomePage(), // หน้าหลัก
    ListPage(), // หน้าการจองทั้งหมด
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.green])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 5, // ขนาดขอบ BottomNavigationBar
          child: BottomNavigationBar( 
              iconSize: 30,
              showSelectedLabels: false, // ไม่แสดงเลเบลที่เลือก
              showUnselectedLabels: true, // แสดงเลเบลที่ไม่ได้เลือก
              currentIndex: _selectedIndex, // แสดงหน้าปัจจุบัน
              type: BottomNavigationBarType.fixed, // กำหนดตำแหน่ง Bot Nav Bar ให้อยู่กับที่ไว้
              items: [
                BottomNavigationBarItem( // Bot Nav Bar หน้าที่ 1
                    icon: Icon(
                      Icons.home,
                      size: 40,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem( // Bot Nav Bar หน้าที่ 2
                    icon: Icon(
                      Icons.calendar_today,
                    ),
                    label: 'Queue'),
              ],
              onTap: _onItemTap),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex), // โดยจะเก็บหน้าทั้งหมดไว้ใน Widget ที่เป็น List
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // กำหนดตำแหน่งปุ่มให้อยู่คั่น Bot Nav Bar
        floatingActionButton: FloatingActionButton( // ปุ่มจองที่อยู่ตรงกลางจอ
          child: Icon(Icons.edit),
          onPressed: () => Navigator.push( 
            context,
            MaterialPageRoute(builder: (context) => Input()), 
          ), // next page ไปยังหน้ากรอกข้อมูลเมื่อกดปุ่มจอง
        ),
      ),
    );
  }
}
