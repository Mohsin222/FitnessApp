import 'package:fitness_app/FetchData.dart';
import 'package:fitness_app/screen/FirstScreen.dart';
import 'package:fitness_app/screen/Login_sign/Registration.dart';
import 'package:fitness_app/screen/Login_sign/login.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  reciveData() async {
    FetchData fetchData = FetchData();

    var newData = await fetchData.getData();
//  print(newData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FirstScreen(
        data: newData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
  //  reciveData();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/intro.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Center(
              child: GestureDetector(
            onTap: () {
              reciveData();
            },
            child: Text(
              'FLASH GYM',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
              ),
            ),
          ),),
               SizedBox(
                 height: 80.0,
               ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        primary: Colors.red,
                      ),
                      child: Text('Login')),
                ),
SizedBox(
  width: 10.0,
),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        primary: Colors.red,
                      ),
                      child: Text('SignUp')),
                ),
              ],
            )
    ]
        ),);
  }
}
