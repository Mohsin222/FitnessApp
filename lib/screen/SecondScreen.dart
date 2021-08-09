import 'package:fitness_app/screen/ExersiceScreen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({this.data, required this.index});
  final data;
  final int index;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int seconds = 10;
  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  '${widget.data['exercises'][widget.index]['thumbnail']}'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff000000),
                Color(0x00000000),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            )),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              width: 200,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(),
                min: 10,
                max: 60,
                onChange: (double value) {
                  seconds = value.toInt();
                  // print(seconds);
                },
                innerWidget: (v) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${v.toInt()} S',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    20.0,
                  )),
                  primary: Color(0xffe83350),
                  textStyle: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExersiceScreen(
                              data: widget.data,
                              index: widget.index,
                              seconds: seconds,
                            )));
              },
              child: Text(
                'Start Exersice',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
