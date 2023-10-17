import 'package:counter_app/Controller/count_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),

        //Floating Add button===================================================
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment, child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Other Page Desig==================================
    return Scaffold(
        body: Center(

            // Access the updated count variable=================================
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You Clicked ${c.count} Times..."),
        ElevatedButton(
            child: const Text("Go Back"), onPressed: () => Get.to(Home()))
      ],
    )));
  }
}
