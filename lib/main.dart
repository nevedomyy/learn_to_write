import 'package:flutter/material.dart';
import 'painter.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Learning(),
    );
  }
}

class Learning extends StatefulWidget {
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning>{
  final List<String> _characters = [
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
    'Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9'
  ];
  final List<Color> _colors = [
    Color.fromRGBO(22, 160, 134, 1),
    Color.fromRGBO(39, 174, 97, 1),
    Color.fromRGBO(42, 128, 185, 1),
    Color.fromRGBO(143, 68, 173, 1),
    Color.fromRGBO(232, 76, 61, 1),
    Color.fromRGBO(231, 126, 35, 1),
    Color.fromRGBO(241, 196, 15, 1),
  ];
  List<List> _list;
  String _character;
  Color _color;

  @override
  initState(){
    super.initState();
    _list = List();
    _character = _characters[0];
    _color = _colors[0];
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width/7;
    double _height = MediaQuery.of(context).size.height/2;
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.arrow_back_ios, color: Colors.black12, size: 20.0,),
                Expanded(
                  child: SizedBox(
                    height: 70.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _characters.length,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            _character = _characters[index];
                            _list.clear();
                            setState((){});
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              _characters[index],
                              style: TextStyle(color: Colors.black54, fontSize: 50.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.black12, size: 20.0,),
              ],
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Text(
                      _character,
                      style: TextStyle(color: Colors.black12, fontSize: _height, fontFamily: 'Codystar'),
                    ),
                  ),
                  CustomPaint(
                    willChange: true,
                    size: Size.infinite,
                    painter: AppPainter(_list, 20.0)
                  ),
                  GestureDetector(
                    onVerticalDragUpdate: (details){
                      _list.add([details.globalPosition.dx, details.globalPosition.dy-_width-30.0, _color]);
                      setState(() {});
                    },
                  )
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 12.0, left: 10.0, right: 10.0),
              child: SizedBox(
                height: _width-13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _colors.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        _color = _colors[index];
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _colors[index],
                            borderRadius: BorderRadius.all(Radius.circular(90.0)),
                            border: Border.all(color: Colors.black54, width: 1.0)
                          ),
                          width: _width-13,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
