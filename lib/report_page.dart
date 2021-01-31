import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:careport_pkti/domain/report.dart';

class ReportPage extends StatefulWidget {
  static String tag = 'report-page';

  @override
  _ReportPageState createState() => _ReportPageState();
}


class _ReportPageState extends State<ReportPage> {
  final _suggestions = <Report>[];
  final _saved = Set<Report>();
  final _biggerFont = TextStyle(fontSize:  18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan'),
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
          _suggestions.add(new Report(
            'Kerusakan Jalan',
            'Terdapat kerusakan jalan di Jl. A',
            'link1',
            )
          );
          
          _suggestions.add(new Report(
            'Sampah Berserakan',
            'Terdapat sampah berserakan di',
            'link2'
          ));

          _suggestions.add(new Report(
            'Lampu Rusak',
            'Terdapat lampu rusak di Jl. A',
            'link3',
            )
          );
          
          _suggestions.add(new Report(
            'Drainase',
            'Drainasenya .....',
            'link4'
          ));

          _suggestions.add(new Report(
            'Adminstrasi',
            'Saya mengalami kendala saat mengurus ...',
            'link5'
          ));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(Report report) {
    final alreadySaved = _saved.contains(report);
    return ListTile(
      title: Text(
        report.getTitle(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(report);
          } else {
            _saved.add(report);
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
            (Report report) {
              return ListTile(
                title: Text(
                  report.getTitle(),
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
              title: Text('Urgen'),
              backgroundColor: Colors.blueAccent,
            ),
            body: ListView(children: divided),
          );
        }
      ),
    );
  }
}