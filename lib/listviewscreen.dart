import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> Fruits = ["Apple", "orange", "mango"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View Screen")),
      body: ListView.builder(
        itemCount: Fruits.length,
        itemBuilder: (context, index) {                    
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: index % 2 != 0
                      ? Colors.amber
                      : Color.fromARGB(255, 125, 3, 147),
                  child: Text(Fruits[index]),
                  
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
