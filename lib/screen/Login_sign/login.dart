import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/FetchData.dart';
import 'package:fitness_app/screen/FirstScreen.dart';
import 'package:fitness_app/screen/Login_sign/Registration.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FetchData fetchData = FetchData();

  var data;
  getingData() async {
    FetchData fetchData = FetchData();
    data = await fetchData.getData();
    //   print(data);
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
                          'https://cdn.pixabay.com/photo/2021/05/13/18/19/sportswear-6251541__340.jpg'),
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
                        'Login',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
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
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        cursorColor: Colors.green,
                        style: TextStyle(
                          color: Colors.red,
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegistrationScreen();
                        }));
                      },
                      child: Text(
                        'Sign Up',
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
                            try {
                              final existingUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (existingUser != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FirstScreen(
                                    data: data,
                                  );
                                }));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            primary: Colors.red,
                          ),
                          child: Text('LOGIN')),
                    ),
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
