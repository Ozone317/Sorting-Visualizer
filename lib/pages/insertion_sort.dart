import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sorting_visualizer/models/painter.dart';
import 'package:sorting_visualizer/routes/routes.dart';

class InsertionSort extends StatefulWidget {
  const InsertionSort({Key? key}) : super(key: key);

  @override
  State<InsertionSort> createState() => _InsertionSortState();
}

class _InsertionSortState extends State<InsertionSort> {
  bool isSorted = false;
  bool isSorting = false;

  List<int> list = [];
  int sampleSize = 100;

  void randomize() {
    list = [];
    for (int i = 0; i < sampleSize; ++i) {
      list.add(Random().nextInt(sampleSize));
    }
    setState(() {});
    isSorted = false;
  }

  Future<void> sort() async {
    isSorting = true;
    for (int i = 1; i < list.length; ++i) {
      int temp = list[i];
      int j = i - 1;
      while (j >= 0 && list[j] > temp) {
        list[j + 1] = list[j];
        --j;
        await Future.delayed(const Duration(microseconds: 1500));
        setState(() {});
      }
      list[j + 1] = temp;
      await Future.delayed(const Duration(microseconds: 1500));
      setState(() {});
    }
    isSorting = false;
    isSorted = true;
  }

  @override
  void initState() {
    randomize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Insertion Sort'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: isSorting ? null : randomize,
                // onPressed: randomize,
                child: const Text('Randomize'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: isSorted
                    ? () {}
                    : isSorting
                        ? null
                        : sort,
                // onPressed: sort,
                child: const Text('Sort'),
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: list.map(
          (number) {
            ++counter;
            return CustomPaint(
                painter: MyPainter(
              width: MediaQuery.of(context).size.width / sampleSize,
              height: number,
              index: counter,
            ));
          },
        ).toList(),
      ),
    );
  }
}
