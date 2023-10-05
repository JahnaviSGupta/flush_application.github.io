import 'package:flutter/material.dart';
import 'hintText.dart' as hintFile;
import 'dart:math';

// Selecting random hint texts form external file hintText
final random = new Random();
var i = random.nextInt(hintFile.list_hintText.length);
String theHintText = hintFile.list_hintText[i];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 87, 73, 178)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var favoriteBathroom = TextEditingController();
  String dataToChange = "";

  void changeData(){

    // Function to display the user input on the screen 

    setState(() {
      String bathroom = favoriteBathroom.text.toString();
      dataToChange =bathroom;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text("Flush App"),
                leading: Image.asset('images/sparkletansparent.png'),
      ),
      
      body: 
      Center(child:Container(
        width: 350,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image.asset('images/sparkletansparent.png',
              width: 125,height: 125,),
              TextField(
                controller: favoriteBathroom,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                color: Colors.blue)
              ),
              hintText: "$theHintText",
            ),
      ),
              Container(height: 11,),
              ElevatedButton(onPressed: changeData,
             
              child: Text("Go")),
              Container(height: 11,),
              Text(
                      '$dataToChange',
                      textAlign: TextAlign.left,
                      
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
    ],)
      ))
      );
  }
}
