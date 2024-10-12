import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.w500,
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.indigo,
                  width: 2,
                ),
                foregroundColor: Colors.indigo,
              ),
              onPressed: () {
                counter = 0;
                setState(() {});
                print(counter);
              },
              icon: const Icon(Icons.settings_backup_restore),
              label: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            backgroundColor: Colors.indigo,
            onPressed: () {
              counter--;
              setState(() {});
              print(counter);
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'increment',
            backgroundColor: Colors.indigo,
            onPressed: () {
              counter++;
              setState(() {});
              print(counter);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
