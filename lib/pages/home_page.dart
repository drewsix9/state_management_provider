import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:state_management_riverpod/counter_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () => Provider.of<CounterProvider>(context, listen: false)
                  .resetCounter(),
              child: const Icon(
                Icons.restart_alt_rounded,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${value.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: Provider.of<CounterProvider>(context, listen: false)
                .incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: Provider.of<CounterProvider>(context, listen: false)
                .decrementCounter,
            tooltip: 'Dencrement',
            child: const Icon(Icons.minimize_rounded),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.timer),
            label: 'Counter Test',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: 'ListTile Test',
          ),
        ],
      ),
    );
  }
}
