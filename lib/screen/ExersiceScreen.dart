import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExersiceScreen extends StatefulWidget {
  ExersiceScreen({this.data, required this.index, required this.seconds});
  final data;
  final int index;
  int seconds;
  @override
  _ExersiceScreenState createState() => _ExersiceScreenState();
}

class _ExersiceScreenState extends State<ExersiceScreen> {
  late Timer timer;
  int _elapsedSeconds = 0;
  bool _iscomplete = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        timer.cancel();
        _iscomplete = true;
      }

      setState(() {
        _elapsedSeconds = t.tick;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  '${widget.data['exercises'][widget.index]['gif']}'),
              fit: BoxFit.contain,
            )),
          ),
          Positioned(
            right: 10,
            top: 15,
            child: IconButton(
              onPressed: () {
                timer.cancel();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 50.0,
              ),
            ),
          ),
          _iscomplete != true
              ? SafeArea(
                  child: Text('$_elapsedSeconds/${widget.seconds} S'),
                )
              : Container(
                  alignment: Alignment.bottomCenter,
                  width: 500,
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 15.0,
                      primary: Color(0xffe83350),
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('back'),
                  ),
                ),
        ],
      ),
    );
  }
}
