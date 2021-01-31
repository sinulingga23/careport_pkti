import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:careport_pkti/domain/group.dart';

class GroupPage extends StatefulWidget {
  static String tag = 'group-page';

  @override
  _GroupPageState createState() => _GroupPageState();
}


class _GroupPageState extends State<GroupPage> {
  final _suggestions = <Group>[];
  final _saved = Set<Group>();
  final _biggerFont = TextStyle(fontSize:  18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group'),
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
          _suggestions.add(new Group(
            'Group 1',
            'Deskripsi Group 1',
            'link1',
            )
          );
          
          _suggestions.add(new Group(
            'Group 2',
            'Deskripsi Group 2',
            'link2',
          ));

          _suggestions.add(new Group(
            'Group 3',
            'Deskripsi Group 3',
            'link3',
            )
          );
          
          _suggestions.add(new Group(
            'Group 4',
            'Deskripsi Group 4',
            'link4',
          ));

          _suggestions.add(new Group(
            'Group 5',
            'Deskripsi Group 5',
            'link5',
          ));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(Group group) {
    final alreadySaved = _saved.contains(group);
    return ListTile(
      title: Text(
        group.getTitle(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(group);
          } else {
            _saved.add(group);
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
            (Group group) {
              return ListTile(
                title: Text(
                  group.getTitle(),
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
              title: Text('Group yang diikuti'),
              backgroundColor: Colors.blueAccent,
            ),
            body: ListView(children: divided),
          );
        }
      ),
    );
  }
}