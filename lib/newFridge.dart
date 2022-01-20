//@dart=2.9
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Pantry.dart';
import 'screen2.dart';
import 'FridgeData.dart';
class newFridgePage extends StatefulWidget {
  @override
  _newFridgePageState createState() => _newFridgePageState();
}

class _newFridgePageState extends State<newFridgePage> {

  var nameController = TextEditingController();
  var quantController = TextEditingController();
  var expController = TextEditingController();

  DateTime myDate;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name"
                ),
              ),
              TextField(
                controller: quantController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Quantity"
                ),
              ),
              TextField(
                controller: expController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Expiration Date"
                ),
              ),


              RaisedButton(
                child: Text("Add Item"),
                onPressed: (){
                  print(nameController.text);
                  print(quantController.text);
                  print(expController.text);
                  var timestamp = new DateTime.now().microsecondsSinceEpoch;
                  FirebaseDatabase.instance.reference().child("FoodData/FridgeData/item"+timestamp.toString()).set(
                      {
                        "name": nameController.text,
                        "quant": quantController.text,
                        "exp": expController.text,
                      }
                      );
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MySecondPage(title: "Freezer",))
                  );
                },
              )
              ]

          ),

          )
        );


  }
}
