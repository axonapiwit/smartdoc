import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/launcher.dart';
import 'package:smartdoc/notifilers/user_notifier.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserNotifier()), // กำหนด Notifier ให้คลุมทุกคลาสไว้
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // ไม่แสดง debug บนจอ
        theme: ThemeData(fontFamily: 'Prompt'), // กำหนดให้ทุกหน้าเป็นฟอนต์ที่เลือก
        home: Launcher());
    // home: NavBar());
  }
}
