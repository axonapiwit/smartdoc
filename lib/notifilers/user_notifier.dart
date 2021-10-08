import 'dart:collection';
import 'package:flutter/widgets.dart';
import '../model/user.dart';

class UserNotifier with ChangeNotifier {
  List<User> _userList = []; // ทำเป็น List ไว้เพราะเราจะเก็บตัวแปรในนี้

  int _userGetServ = 0; // กำหนดตัวแปรเพื่อใช้ใน function เพื่อนับการจองคิว
  int get userGetServ => _userGetServ;

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList); // เรียกดูค่า userList

  int getGeneral() { // เป็น function ที่ดึงจำนวนคนที่คิวตรงกับประเภทการรักษาทั่วไป
    return _userList.where((element) => element.treat == 'รักษาทั่วไป').length; // ฟิลเตอร์ตามเงื่อนไข
  }

  int getDentist() { // เป็น function ที่ดึจำนวนคนที่่คิวตรงกับประเภทห้องทันตกรรม
    return _userList.where((element) => element.treat == 'ห้องทันตกรรม').length;
  }

  void addUser(User user) { // function เพิ่มการจอง
    _userList.add(user);
    notifyListeners(); // ให้สัญญาณว่ามีการเปลี่ยนแปลง
  }

  void incrementGetServ() { // function นับจำนวนการจองคิว
    _userGetServ++;
    notifyListeners();
  }
}
