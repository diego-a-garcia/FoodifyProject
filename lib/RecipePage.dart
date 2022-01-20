//@dart=2.9
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Pantry.dart';
import 'screen2.dart';
import 'FridgeData.dart';
import 'Freezer.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Food Storage Navigation'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Page 2",))
                  );
                },
              ),
              ListTile(
                title: const Text('Fridge'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MySecondPage(title: "Page 2",))
                  );
                },
              ),
              ListTile(
                title: const Text('Pantry'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyPantryPage(title: "Pantry",))
                  );
                },
              ),
              ListTile(
                title: const Text('Freezer'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyFreezerPage(title: "Freezer",))
                  );
                },
              ),
            ],
          ),
        ),


        body: Center(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
            Image(
            image: AssetImage('assets/cookie.jpg'),
              width: 700,
              height: 600,
        ),
      ]
    ),

        ),
        appBar: AppBar(
    // Here we take the value from the MyHomePage object that was created by
    // the App.build method, and use it to set our appbar title.
          title: Text("Recipe of The Day"),
      ),
    );


  }
}