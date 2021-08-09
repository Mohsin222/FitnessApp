import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/FetchData.dart';
import 'package:fitness_app/screen/FirstScreen.dart';
import 'package:fitness_app/screen/Login_sign/login.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  var data;
  getingData() async {
    FetchData fetchData = FetchData();
    data = await fetchData.getData();
    //print(data);
  }

  @override
  void initState() {
    super.initState();
    getingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                //height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2017/08/10/23/36/street-workout-2628919__340.jpg'),
                      fit: BoxFit.cover,
                    ),
                    //border: Border.all(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    )),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Registration',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    //email box
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        cursorColor: Colors.green,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your username',
                          // prefix: Icon(
                          //   Icons.print,
                          //   color: Colors.red,
                          // ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    //password box
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        cursorColor: Colors.green,
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your password',

                          // prefix: Icon(
                          //   Icons.print,
                          //   color: Colors.red,
                          // ),
                        ),
                        //   keyboardType: TextInputType.numberWithOptions(),
                        obscureText: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            // print(email);
                            // print(password);
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstScreen(
                                              data: data,
                                            )));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            primary: Colors.red,
                          ),
                          child: Text('SignUp')),
                    ),
                    //
                    // bottom
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '@Mohsin Irfan',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
