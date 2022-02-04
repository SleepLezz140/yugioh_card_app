import 'package:flutter/material.dart';
import 'model/card.dart';

void main() => runApp(DetailApp());

class DetailApp extends StatefulWidget{

  final YugiohCard data;
  const DetailApp({Key key, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailAppState(data);
  }
}


class _DetailAppState extends State<DetailApp>{

  final YugiohCard data;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  _DetailAppState(this.data);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        // ignore: deprecated_member_use
        scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content:Text(data.name),
              duration:Duration(seconds: 1),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Card Information'),),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.name, style: TextStyle(fontSize: 24),),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(data.type),
                  Text(' | '),
                  Text(data.race),
                  
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.desc),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 9),
          ),
          Image.network(
            data.card_images[0].image_url,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
