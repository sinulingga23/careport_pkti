import 'package:flutter/material.dart';
import 'report_page.dart';
import 'artilce_page.dart';
import 'group_page.dart';
import 'friend_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Careport',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Careport'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(child: _buildImageColumn(context)),
      ),
    );
  }

  Widget _buildImageColumn(BuildContext context) => Container(
    decoration: BoxDecoration(
      // color: Colors.,
    ),
    child: Column(
      children: [
        _buildImageRow(1, context),
        _buildImageRow(3, context),
      ],
    ),
  );


  Widget _buildDecoratedImage(int imageIndex, BuildContext context) => Expanded(
    child: InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.blueGrey),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset('assets/images/pic$imageIndex.png'),
      ),
      onTap: () {
        switch (imageIndex) {
          case 1: {
            Navigator.of(context).pushNamed(ReportPage.tag);
          }
          break;
          case 2: {
            Navigator.of(context).pushNamed(ArticlePage.tag);
          }
          break;
          case 3: {
            Navigator.of(context).pushNamed(GroupPage.tag);
          }
          break;
          case 4: {
            Navigator.of(context).pushNamed(FriendPage.tag);
          }
          break;
        }
      },
    ),
  );

  Widget _buildImageRow(int imageIndex, BuildContext context) => Row(
    children: [
      _buildDecoratedImage(imageIndex, context),
      _buildDecoratedImage(imageIndex + 1, context),
    ],
  );
}
