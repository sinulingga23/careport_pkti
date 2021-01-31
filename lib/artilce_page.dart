import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:careport_pkti/domain/article.dart';

class ArticlePage extends StatefulWidget {
  static String tag = 'article-page';

  @override
  _ArticlePageState createState() => _ArticlePageState();
}


class _ArticlePageState extends State<ArticlePage> {
  final _suggestions = <Article>[];
  final _saved = Set<Article>();
  final _biggerFont = TextStyle(fontSize:  18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
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
          _suggestions.add(new Article(
            'Kerusakan Jalan',
            'Terdapat kerusakan jalan di Jl. A',
            'link1',
            )
          );
          
          _suggestions.add(new Article(
            'Sampah Berserakan',
            'Terdapat sampah berserakan di',
            'link2'
          ));

          _suggestions.add(new Article(
            'Lampu Rusak',
            'Terdapat lampu rusak di Jl. A',
            'link3',
            )
          );
          
          _suggestions.add(new Article(
            'Drainase',
            'Drainasenya .....',
            'link4'
          ));

          _suggestions.add(new Article(
            'Adminstrasi',
            'Saya mengalami kendala saat mengurus ...',
            'link5'
          ));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(Article article) {
    final alreadySaved = _saved.contains(article);
    return ListTile(
      title: Text(
        article.getTitle(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(article);
          } else {
            _saved.add(article);
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
            (Article article) {
              return ListTile(
                title: Text(
                  article.getTitle(),
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
              title: Text('Favorite'),
              backgroundColor: Colors.blueAccent,
            ),
            body: ListView(children: divided),
          );
        }
      ),
    );
  }
}