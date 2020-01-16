import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:navigation_test/utils/consts.dart';
import 'package:navigation_test/utils/emoji_score.dart';
import 'package:navigation_test/screens/todo.dart';
import 'package:navigation_test/screens/analysis.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  var parser = EmojiParser();
  EmojiScore emojiScoreList = new EmojiScore();

  bool _markedAnswers = false;
  String recommendationText = "";

  void getEmoji1() {
    setState(() {
      _markedAnswers = true;
      emojiScoreList.addItem(10);
    });
  }

  void getEmoji2() {
    setState(() {
      _markedAnswers = true;
      emojiScoreList.addItem(8);
    });
  }

  void getEmoji3() {
    setState(() {
      _markedAnswers = true;
      emojiScoreList.addItem(6);
    });
  }

  void getEmoji4() {
    setState(() {
      _markedAnswers = true;
      emojiScoreList.addItem(4);
    });
  }

  void getEmoji5() {
    setState(() {
      _markedAnswers = true;
      emojiScoreList.addItem(2);
    });
  }

  String decideWriteUp() {
    // TODO: This has to be the average of last couple of days
    double previousScores =
        emojiScoreList.emojiScoreList[emojiScoreList.emojiScoreList.length - 1];
    if (previousScores > 8) {
      recommendationText =
          "You look energetic, channelize it the best possible way.";
    } else if (previousScores > 6) {
      recommendationText = "Spend less time on social media.";
    } else if (previousScores > 4) {
      recommendationText = "Have some fun!";
    } else if (previousScores > 2) {
      recommendationText = "Something bad is bothering you. Keep cool!";
    } else if (previousScores > 0) {
      recommendationText = "Consult a doctor.";
    }
    return recommendationText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      margin: EdgeInsets.all(contentMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: FutureBuilder(
                    future: getGoogleData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Card(
                          elevation: 10,
                          color: Colors.lime,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No history",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 75.0,
                                fontFamily: "Agne",
                              ),
                            ),
                          ),
                        ));
                      }
                      return snapshot.connectionState == ConnectionState.done
                          ? Center(
                              child: Card(
                              elevation: 10,
                              color: Colors.lime,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.toString(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 75.0,
                                    fontFamily: "Agne",
                                  ),
                                ),
                              ),
                            ))
                          : Center(child: CircularProgressIndicator());
                    }),
              ),
              Flexible(
                child: FutureBuilder(
                    future: getSocialData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Card(
                          elevation: 10,
                          color: Colors.lime,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No history",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 75.0,
                                fontFamily: "Agne",
                              ),
                            ),
                          ),
                        ));
                      }
                      return snapshot.connectionState == ConnectionState.done
                          ? Center(
                              child: Card(
                              elevation: 10,
                              color: Colors.lime,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.toString(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 75.0,
                                    fontFamily: "Agne",
                                  ),
                                ),
                              ),
                            ))
                          : Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Browsing Score",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                "Social Media Score",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: FutureBuilder(
                    future: _getQuote(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Card(
                          elevation: 10,
                          color: Colors.teal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "If You Are Working On Something That You Really Care About, You Don’t Have To Be Pushed. The Vision Pulls You.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: "Agne",
                              ),
                            ),
                          ),
                        ));
                      }
                      return snapshot.connectionState == ConnectionState.done
                          ? Center(
                              child: Card(
                              elevation: 10,
                              color: Colors.teal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: "Agne",
                                  ),
                                ),
                              ),
                            ))
                          : Center(child: CircularProgressIndicator());
                    }),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Divider(
            height: 10,
          ),
          Text(
            "How are you feeling?",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: !_markedAnswers
                ? <Widget>[
                    InkWell(
                      onTap: () {
                        getEmoji1();
                      },
                      child: new EmojiCard(
                        parser: parser,
                        emoji: "smiley",
                        label: "Great",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getEmoji2();
                      },
                      child: new EmojiCard(
                        parser: parser,
                        emoji: "relieved",
                        label: "Happy",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getEmoji3();
                      },
                      child: new EmojiCard(
                        parser: parser,
                        emoji: "neutral_face",
                        label: "Neutral",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getEmoji4();
                      },
                      child: new EmojiCard(
                        parser: parser,
                        emoji: "pensive",
                        label: "Sad",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getEmoji5();
                      },
                      child: new EmojiCard(
                        parser: parser,
                        emoji: "worried",
                        label: "Low",
                      ),
                    ),
                  ]
                : <Widget>[
                    Text(
                      "Thanks for your feedback",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            decideWriteUp(),
            style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                color: Colors.black45),
          ),
          SizedBox(
            height: 30.0,
          ),
          Divider(
            height: 10,
          ),
          Text(
            "Top Reminders",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/todo');
            },
            child: Card(
              color: Colors.cyan,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Exercise",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "8 glasses of water",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmojiCard extends StatelessWidget {
  const EmojiCard({
    Key key,
    @required this.parser,
    @required this.emoji,
    @required this.label,
  }) : super(key: key);

  final EmojiParser parser;
  final String emoji;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
          child: Text(
            parser.emojify(":" + this.emoji + ":"),
            style: TextStyle(fontSize: 42.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          this.label,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}

/// Quote kindly supplied by https://theysaidso.com/api/
Future<String> _getQuote() async {
  var response = await http.get('http://quotes.rest/qod.json');

  if (response.statusCode == 200) {
    return json.decode(response.body)['contents']['quotes'][0]['quote'];
  } else {
    throw Exception('Failed to load internet');
  }
}

Future<int> getGoogleData() async {
  var response = await http.get('http://192.168.43.25:5000/api/');

  return json.decode(response.body)['google_search'];
}

Future<int> getSocialData() async {
  var response = await http.get('http://192.168.43.25:5000/api/');

  return json.decode(response.body)['social_media'];
}
