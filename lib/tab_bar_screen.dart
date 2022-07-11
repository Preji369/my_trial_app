import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  // const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin {
 late TabController _tabbarcontroller;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabbarcontroller=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Stack(
          children: [
            Container(
              width: 300,
              color: Colors.amber,
              height: 300,
            ),
            Container(
              width: 200,
              color: Colors.green,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                color: Colors.black,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
