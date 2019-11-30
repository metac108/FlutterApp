import 'package:flutter/material.dart';
import 'package:wasterage/binmap.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Image.asset(
                    "images/kachra.gif",
                    height: 0.3 * MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(height: (0.4) * MediaQuery.of(context).size.height,),
              OutlineButton(
                onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapPage()));                },
                child: Text("Know status of nearby bins",style: TextStyle(color: Colors.blue, fontSize: 20)),
                borderSide: BorderSide(color: Colors.blue),
                shape: StadiumBorder(),
                padding: EdgeInsets.all(10),
              ),
              Container(
                height: 0.05 * MediaQuery.of(context).size.height,
              ),
                           OutlineButton(
                onPressed: () {},
                child: Text("Track your collection vehicle",style: TextStyle(color: Colors.blue, fontSize: 20)),
                borderSide: BorderSide(color: Colors.blue),
                shape: StadiumBorder(),
                padding: EdgeInsets.all(10),
              ), 
          ],
        ),
      );
    }
}