import 'package:diego_test/FridgeData.dart';
import 'package:flutter/material.dart';
import "Pantry.dart";
import 'Freezer.dart';
import 'main.dart';
import 'FridgeData.dart';
import 'newFridge.dart';
import 'package:firebase_database/firebase_database.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {

  var food = [];

  _MySecondPageState(){
    FirebaseDatabase.instance.reference().child("FoodData/FridgeData").once()
        .then((datasnapshot){
          var itemsTemp = [];
          datasnapshot.value.forEach((k,v){
            itemsTemp.add(v);
          });
          food = itemsTemp;
          print(food);
          setState(() {

          });
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent ,
      body:ListView.builder(
        itemCount: food.length,

        itemBuilder: (context, index) {
          return Container(
            height:50,
            margin: EdgeInsets.only(top:5, bottom:5,left:20,right:20),
            decoration: new BoxDecoration(
              color: Colors.white
            ),


            child: Row(


              children: [
                Image(
                    image: AssetImage('assets/fridge.jpg')
                ),
                Text(

                    ' ${food[index]["name"]}',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rakeway',
                  ),

                ),
                Spacer(),

                Text(
                    '${food[index]["quant"]}',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rakeway',
                  ),
                ),
                Spacer(),
                Text(
                    '${food[index]["exp"]}',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rakeway',
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
                    context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Home",))
                );
              },
            ),
            ListTile(
              title: const Text('Fridge'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pop(context);

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

      appBar: AppBar(

        title: Text("Fridge"),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => newFridgePage())
          );
        },
        child: Icon(Icons.food_bank)
      ) ,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}