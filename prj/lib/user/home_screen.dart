import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mdp_prj/sample/addstudentpage.dart';
import 'package:mdp_prj/user/signin.dart';

import '../sample/liststudentpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CRUD APP'),
              ElevatedButton(
                onPressed: () async => {
                  await FirebaseAuth.instance.signOut(),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                      (route) => false)
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddStudentPage(),
                    ),
                  )
                },
            child: Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: ListStudentPage());
  }
}
