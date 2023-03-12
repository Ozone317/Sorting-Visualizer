import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sorting_visualizer/models/painter.dart';
import 'package:sorting_visualizer/routes/routes.dart';

class QuickSort extends StatefulWidget {
  const QuickSort({Key? key}) : super(key: key);

  @override
  State<QuickSort> createState() => _QuickSortState();
}

class _QuickSortState extends State<QuickSort> {
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

  Future<void> quickSort(int l, int h) async {
    if (l < h) {
      int mid = await partition(l, h);
      await quickSort(l, mid - 1);

      await quickSort(mid + 1, h);

      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {});
    }
    return;
  }

  Future<int> partition(int l, int h) async {
    int i = l;
    int j = h;
    int pivot = l;

    while (i < j) {
      while (list[i] <= list[pivot] && i < h) {
        ++i;
        // await Future.delayed(const Duration(milliseconds: 900));
        // setState(() {});
      }
      while (list[j] > list[pivot] && j > l) {
        --j;
        // await Future.delayed(const Duration(milliseconds: 900));
        // setState(() {});
      }
      if (i < j) {
        int temp = list[i];
        list[i] = list[j];
        list[j] = temp;
      }
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {});
    }
    int temp = list[pivot];
    list[pivot] = list[j];
    list[j] = temp;

    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {});

    return j;
  }

  void sort() async {
    isSorting = true;
    await quickSort(0, list.length - 1);
    setState(() {});

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
        title: const Text('Quick Sort'),
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
                onPressed: isSorting ? null : sort,
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
