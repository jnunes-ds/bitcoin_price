import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _price = "0";

  void _recoverPrice() async {

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> returning = json.decode(response.body);
    setState(() {
      _price = returning["BRL"]["buy"].toString();
    });
    print("Resultado: " + returning["BRL"]["buy"].toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Text(
              "value",
              style: TextStyle(
                fontSize: 60
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text(
                    "Real",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text(
                    "Dollar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: (){},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
