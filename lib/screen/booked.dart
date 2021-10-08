import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartdoc/components/cards.dart';
import 'package:smartdoc/notifilers/user_notifier.dart';

class Booked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context); // เรียกใช้ method ของ UserNotifier  
    return Container(
      padding: EdgeInsets.all(30.0),
      child: GridView.count( // แสดงผลออกมาเป็นรูปแบบตาราง
        crossAxisCount: 2, // กำหนดจำนวนกล่อง
        shrinkWrap: true, // กล่องจะลงไปอยู่ด้านล่างหากเกินขนาดจอ
        physics: NeverScrollableScrollPhysics(),
        children: [
          Cards( // เรียกใช้ component แล้วระบุค่าลงไปเลย โดยค่าจะดึงผ่านตัวแปรที่เรากำหนดให้ตรงกัน
            title: '0 คน',
            subTitle: 'รอซักประวัติ',
            imgName: 'assets/images/nurse.png',
          ),
          Cards(
            title: '${userNotifier.getGeneral()} คน', // เรียกใช้งานฟังชันก์จำนวนคนของการรักษาทั่วไป
            subTitle: 'ห้องรักษาทั่วไป',
            imgName: 'assets/images/male-doctor.png',
          ),
          Cards(
            title: '${userNotifier.getDentist()} คน', // เรียกใช้งานฟังชันก์จำนวนคนห้องทันตกรรม
            subTitle: 'ห้องทันตกรรม',
            imgName: 'assets/images/dentist3.png',
          ),
          Cards(
            title: '0 คน',
            subTitle: 'ห้องจ่ายยา',
            imgName: 'assets/images/medical.png',
          ),
        ],
      ),
    );
  }
}
