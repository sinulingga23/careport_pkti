import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'sign_up.dart';
import 'report_page.dart';
import 'artilce_page.dart';
import 'group_page.dart';
import 'friend_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    SignUpPage.tag: (context) => SignUpPage(),
    ReportPage.tag: (context) => ReportPage(),
    ArticlePage.tag: (context) => ArticlePage(),
    GroupPage.tag: (context) => GroupPage(),
    FriendPage.tag: (context) => FriendPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Careport',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.green, fontFamily: 'Nunito'),
      home: new LoginPage(),
      routes: routes,
    );
  }
}