import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/count_logic.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final Controller _xController = Get.put(Controller());

  int _counter = 0;
  String _text = 'TEXT Counter';
  final List<String> _list = ['Bangla', 'Hindi'];

  void _incrementCounter() {
    setState(() {
      _counter++;

      _text = 'TEXT Counter= ${_counter.toString()}';

      _list.add('TEXT Counter= ${_counter.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text),
            Text('$_counter',
              style: Theme.of(context).textTheme.headlineMedium),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Text(_list[index]);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {
   const HomePage({super.key});
  //final Controller _xController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
