import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = 'TEXT Counter';
  final List<String> _list = ['Bangla', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Simple Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_text),
            Text('$_counter',
                style: Theme.of(context).textTheme.headlineMedium),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Text(_list[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    //Refreshing everytime button clicks========================================
    setState(() {
      _counter++;

      _text = 'TEXT Counter= ${_counter.toString()}';

      _list.add('TEXT Counter= ${_counter.toString()}');
    });
  }
}
