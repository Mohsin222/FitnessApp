import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screen/SecondScreen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({this.data});
  final data;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      if (_auth.currentUser == null) {
        print('MOHDIND');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout_outlined))
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return SecondScreen(
                      data: widget.data,
                      index: index,
                    );
                  }));
                },
                child: Container(
                  margin: EdgeInsets.all(
                    10.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${widget.data['exercises'][index]['thumbnail']}',
                      ),
                      fit: BoxFit.cover,
                    ),
                    //   border: Border.all(color: Colors.blueAccent),

                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        // i create new container because gradient not work
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.data['exercises'][index]['title']}',
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}






  //  child: Column(
  //                 children: [
  //                   Text('${widget.data['exercises'][index]['id']}'),
  //                   Text('${widget.data['exercises'][index]['id']}'),
  //                   Image(
  //                       image: NetworkImage(
  //                           '${widget.data['exercises'][index]['thumbnail']}'))
  //                 ],
  //               ),