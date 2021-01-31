import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:careport_pkti/domain/friend.dart';

class FriendPage extends StatefulWidget {
  static String tag = 'friend-page';

  @override
  _FriendPageState createState() => _FriendPageState();
}


class _FriendPageState extends State<FriendPage> {
  final _suggestions = <Friend>[];
  final _saved = Set<Friend>();
  final _biggerFont = TextStyle(fontSize:  18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi teman'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: _buildSuggestions(),
      // backgroundColor:,
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.add(new Friend(
            'Rekomendasi Teman 1',
            'Deskripsi Teman 1',
            'link1',
            )
          );
          
          _suggestions.add(new Friend(
            'Rekomendasi Teman 2',
            'Deskripsi Teman 2',
            'link2'
          ));

          _suggestions.add(new Friend(
            'Rekomendasi Teman 3',
            'Deskripsi Teman 3',
            'link3'
            )
          );
          
          _suggestions.add(new Friend(
            'Rekomendasi Teman 4',
            'Deskripsi Teman 4',
            'link5'
          ));

          _suggestions.add(new Friend(
            'Rekomendasi Teman 5',
            'Deskripsi Teman 5',
            'link5'
          ));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(Friend friend) {
    final alreadySaved = _saved.contains(friend);
    return ListTile(
      title: Text(
        friend.getName(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(friend);
          } else {
            _saved.add(friend);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (Friend friend) {
              return ListTile(
                title: Text(
                  friend.getName(),
                  style: _biggerFont,
                ),
              );
            }
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Teman saya'),
              backgroundColor: Colors.blueAccent,
            ),
            body: ListView(children: divided),
          );
        }
      ),
    );
  }
}