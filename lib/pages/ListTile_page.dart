import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:state_management_riverpod/counter_provider.dart';

class ListTilePage extends StatelessWidget {
  const ListTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Tile Page'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'incrementbtn',
            onPressed: Provider.of<CounterProvider>(context, listen: false)
                .incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrementbtn',
            onPressed: Provider.of<CounterProvider>(context, listen: false)
                .decrementCounter,
            tooltip: 'Dencrement',
            child: const Icon(Icons.minimize_rounded),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            GoRouter.of(context).go('/');
          } else {
            GoRouter.of(context).go('/listtilepage');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Counter Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListTile Test',
          ),
        ],
      ),
    );
  }
}
