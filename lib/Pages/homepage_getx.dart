import 'dart:io';

import 'package:counter_app/Controller/count_logic.dart';
import 'package:counter_app/Controller/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    //Initializing logic class to make it available for all "child" routes======
    final Controller c = Get.put(Controller());
    final ImagePickController imageController = Get.put(ImagePickController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX Counter App"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[200],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Updating only below widget using getx==========================
              Obx(() => Text("Clicks: ${c.count}")),

              const SizedBox(height: 20),

              ElevatedButton(
                child: const Text("Go to Other"),
                onPressed: () => Get.to(Other()),
              ),

              const SizedBox(height: 20),

              Obx(
                () => Container(
                  height: Get.height * .2,
                  width: Get.width * .3,
                  color: Colors.deepPurple.withOpacity(c.opacity.value),
                ),
              ),
              Obx(
                () => Slider(
                    value: c.opacity.value,
                    onChanged: (value) {
                      c.opacity.value = value;
                    }),
              )
            ],
          ),
        ),

        //Floating Add button===================================================
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment, child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();
  final ImagePickController imageController = Get.find();

  @override
  Widget build(context) {
    // Other Page Desig==================================
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX Counter App"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[200],
        ),
        body: Center(

            // Access the updated count variable=================================
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You Clicked ${c.count} Times..."),
            ElevatedButton(
              child: const Text("Go Back"),
              onPressed: () => Get.to(Home()),
            ),
            const SizedBox(height: 20),
            Obx(
              () => CircleAvatar(
                radius: 40,
                backgroundImage: imageController.imagePath.isNotEmpty
                    ? FileImage(File(imageController.imagePath.toString()))
                    : null,
              ),
            ),
            TextButton(
              onPressed: () {
                imageController.getImage();
              },
              child: const Text('Pick Image'),
            ),
          ],
        )));
  }
}
