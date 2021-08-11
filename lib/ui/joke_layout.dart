import 'package:flutter/material.dart';
import 'package:joke_app/model/joke_model.dart';

class JokeDetails extends StatelessWidget {
  JokeDetails({required this.isTabletLayout, required this.joke});
  final bool isTabletLayout;
  final Joke joke;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.setup ?? 'No joke selected',
            style: textTheme.headline3,
          ),
        ),
        Text(joke?.punchline ?? 'No joke selected', style: textTheme.subhead),
      ],
    );
    if (isTabletLayout) {
      return Center(
        child: content,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke App"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: content,
      ),
    );
  }
}
