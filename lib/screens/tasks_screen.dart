import 'package:flutter/material.dart';
import 'package:moon_list/components/constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLogInStatus();
  }

  checkLogInStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => TasksScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Moon List",
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () async {
              sharedPreferences.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text(
                    'Tasks',
                    style: kHeaderBoldTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.0),
                  child: Icon(
                    Icons.nightlight_round,
                    size: 35.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ListView(
                  children: <Widget>[],
                ),
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 14.0,
              unselectedFontSize: 14.0,
              items: [
                BottomNavigationBarItem(
                  title: Text('Home'),
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text('Profile'),
                  icon: Icon(
                    Icons.person,
                  ),
                ),
              ],
              onTap: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
