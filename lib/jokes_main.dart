import 'package:flutter/material.dart';
import 'package:joke_app/model/joke_model.dart';
import 'package:joke_app/ui/joke_layout.dart';
import 'package:joke_app/ui/joke_listing.dart';

class Jokes extends StatefulWidget {
  const Jokes({Key? key}) : super(key: key);

  @override
  _JokesState createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  static const int tabletBreakPoint = 600;
  Joke _selectedJoke = Joke(id: 1, type: "", setup: "", punchline: "");

  @override
  Widget build(BuildContext context) {
    Widget _buildMobileLayout() {
      return JokeListing((jokeSelected) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return JokeDetails(isTabletLayout: false, joke: jokeSelected);
        }));
      }, Joke(id: 1, type: "", setup: "", punchline: ""));
    }

    Widget _buildTabletLayout() {
      return Row(
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Material(
                elevation: 9,
                child: JokeListing((joke) {
                  setState(() {
                    _selectedJoke = joke;
                  });
                }, _selectedJoke),
              )),
          Flexible(
              flex: 3,
              child: JokeDetails(
                isTabletLayout: true,
                joke: _selectedJoke,
              ))
        ],
      );
    }

    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakPoint) {
      content = _buildMobileLayout();
    } else
      content = _buildTabletLayout();
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke"),
      ),
      body: content,
    );
  }
}
