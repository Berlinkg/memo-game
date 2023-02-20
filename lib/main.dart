import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/utils/game_logic.dart';
import 'package:game/wigjet/scor_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomPage(),
    );
  }
}

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HompageState();
}

class _HompageState extends State<HomPage> {
  Game _game = Game();
  int tries = 0;
  int scors = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 129, 26),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'memory game',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScorBoard("tries", "$tries"),
                ScorBoard("score", "$scors"),
              ],
            ),
            SizedBox(
              height: screen_width,
              width: screen_width,
              child: GridView.builder(
                  itemCount: _game.gameImg!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: EdgeInsets.all(16.0),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                        onTap: () {
                          print(_game.cards_list[index]);
                          setState(() {
                            tries++;
                            _game.gameImg![index] = _game.cards_list[index];
                            _game.matchCheck
                                .add({index: _game.cards_list[index]});
                          });
                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              print(true);
                              scors += 100;
                              _game.matchCheck.clear();
                            } else {
                              print(false);
                              Future.delayed(Duration(milliseconds: 500), () {
                                print(_game.gameImg);
                                setState(() {
                                  _game.gameImg![_game.matchCheck[0].keys
                                      .first] = _game.hiddenCartpath;

                                  _game.gameImg![_game.matchCheck[1].keys
                                      .first] = _game.hiddenCartpath;
                                  _game.matchCheck.clear();
                                });
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Color(0xFFFF84a6),
                              borderRadius: BorderRadius.circular(08.0),
                              image: DecorationImage(
                                  image: AssetImage(_game.gameImg![index]),
                                  fit: BoxFit.cover)),
                        ));
                  })),
            )
          ],
        ),
      ),
    );
  }
}
