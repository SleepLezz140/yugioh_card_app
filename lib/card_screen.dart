// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'card_details.dart';
import 'model/card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/response.dart';
import 'dart:io';


Future<Response> fetchCard() async{
  final response = await http.get('https://db.ygoprodeck.com/api/v7/cardinfo.php?num=150&offset=100');
  if(response.statusCode == 200){
    return Response.fromJsonMap(json.decode(response.body));
  }else{
    throw Exception('Failed to load data');
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yugioh Card App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '150 Yugioh Cards'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_horiz_rounded,
            color: Colors.black87),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                child: Text('Exit'),
                value: 1,
              )
            ],
            onSelected: (value){
              _showDialog();
            },
          )
        ],
      ),
      body: _GridView(data: fetchCard(),),
    );
  }

  void _showDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Attention'),
          content: Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                exit(0);
              },
              child: Text('Yes')
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('No')
            )
          ],
        );
      }
    );
  }
}

class _GridView extends StatelessWidget{

  final Future<Response> data;
  _GridView({Key key, this.data}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response> (
      future: data,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index){
                return _CardItemView(data: YugiohCard.fromJsonMap(snapshot.data.data[index]),);
              },
              itemCount: snapshot.data.data.length,
            );
          }
        }else{
          return LinearProgressIndicator();
        }
      },
    );
  }
}

class _CardItemView extends StatelessWidget{

  final YugiohCard data;

  _CardItemView({Key key, this.data}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailApp(data: data,)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Image.network(data.card_images[0].image_url_small,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      data.name,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
