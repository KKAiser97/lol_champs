import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/const.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/data/lol/models/skin/skin_model.dart';

class SkinScreen extends StatefulWidget {
  final Skin skin;
  final Champion champion;
  const SkinScreen({@required this.skin, this.champion});
  @override
  _SkinScreenState createState() => _SkinScreenState();
}

class _SkinScreenState extends State<SkinScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Skin Detail'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Center(
        child: Column(
          children: [
            // Image.network(
            //     '$ASSETS_BASE/${widget.champion.id}/splash-art/skin/${widget.skin.id.toString().substring(widget.skin.id.toString().length - 3)}'),
            SizedBox(height: 50),
            Text(
              widget.skin.skinName ?? 'This is a normal name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.skin.isBase == true ? 'Base skin' : '',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'Rarity: ' + widget.skin.rarity.substring(1),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[600],
              ),
            ),
            Text(
              widget.skin.isLegacy == true ? 'Legacy!' : '',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Text(widget.skin.description ??
                  "This is a very very normal skin that I have nothin' to tell about it!"),
            ),
          ],
        ),
      ),
    ));
  }
}
