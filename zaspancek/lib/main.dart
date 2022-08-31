// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GlavnaScena(),
    );
  }
}

class GlavnaScena extends StatefulWidget {
  const GlavnaScena({Key? key,}) : super(key: key);

  @override
  State<GlavnaScena> createState() => _GlavnaScenaState();
}

class _GlavnaScenaState extends State<GlavnaScena> {
  String zaspancekStatus = 'deaktiviran';
  String cajt = '';
  Color zelena = const Color(0xffa7e0a5);
  Color rdeca = const Color(0xffdf6861);
  Color modra = const Color(0xff96d0ff);
  void nc(){}

  void getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = formatDateTime(now);
    setState(() {
      cajt = formattedDateTime;
    });
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  void initState()
  {
    super.initState();
    cajt = formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff22272e),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            Padding(padding: EdgeInsets.only(top: 15)),
            RichText(
              text: TextSpan(
                text: 'zaspancek je ',
                style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'Courier New'),
                children: <TextSpan>[
                  TextSpan(text: '{$zaspancekStatus}', style: TextStyle(color: (zaspancekStatus == 'aktiviran') ? zelena : rdeca)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 51)),
            RichText(
              text: TextSpan(
                text: 'cajt je ',
                style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'Courier New'),
                children: <TextSpan>[
                  TextSpan(text: '{$cajt}', style: TextStyle(color: modra, fontSize: 25)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 51)),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nc,
        child: const Icon(Icons.add),
      ),
    );
  }
}
