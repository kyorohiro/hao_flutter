import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Flutter layout", home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter layout demo"),
        ),
        body: Column(
          children: [
            _imageSection(),
            _tileSection(),
            _buttonSection(context),
            _textSection()
          ],
        ));
  }

  Widget _tileSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          //
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text("Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey[500])),
            ],
          )),
          FavoriteWidget(),//Icon(Icons.star, color: Colors.red[500]),Text('41')
        ],
      ),
    );
  }

  Widget _buttonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }

  Widget _textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  Widget _imageSection() {
    return Image.asset("images/lake.jpg",
        width: 600, height: 240, fit: BoxFit.cover);
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoriteWidgetState();
  }
}

class FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, //
      children: [
        //
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border)), //
              alignment: Alignment.centerRight,
              onPressed: () {
                print("on press fav icon");
                setState(() {
                  if (_isFavorited) {
                    _favoriteCount -= 1;
                    _isFavorited = false;
                  } else {
                    _favoriteCount += 1;
                    _isFavorited = true;
                  }
                });
              }),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}
