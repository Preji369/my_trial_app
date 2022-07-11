import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  String dropdownvalue = 'Category';

  // List of items in our dropdown menu
  var items = [
    'New Arrival',
    'Fast Moving',
    'Discounted',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Products",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 20, 2, 57),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add Image")),
          DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.price_check),
              label: Text("Price")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
