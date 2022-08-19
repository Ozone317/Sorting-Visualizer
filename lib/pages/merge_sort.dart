import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sorting_visualizer/models/painter.dart';
import 'package:sorting_visualizer/routes/routes.dart';

class MergeSort extends StatefulWidget {
  const MergeSort({Key? key}) : super(key: key);

  @override
  State<MergeSort> createState() => _MergeSortState();
}

class _MergeSortState extends State<MergeSort> {
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
    await mergeSort(0, list.length - 1);
    setState(() {});

    isSorting = false;
    isSorted = true;
  }

  Future<void> mergeSort(int low, int high) async {
    if (low < high) {
      int mid = (low + high) ~/ 2;
      await mergeSort(low, mid);
      await Future.delayed(const Duration(microseconds: 500));
      setState(() {});

      await mergeSort(mid + 1, high);
      await Future.delayed(const Duration(microseconds: 900));
      setState(() {});

      await merge(low, mid, high);
      await Future.delayed(const Duration(microseconds: 500));
      setState(() {});
    }
  }

  Future<void> merge(int low, int mid, int high) async {
    int i = low;
    int j = mid + 1;
    int k = low;
    List<int> newList = List.generate(list.length, (index) => 0);

    while (i <= mid && j <= high) {
      if (list[i] < list[j]) {
        newList[k] = list[i];
        ++i;
      } else {
        newList[k] = list[j];
        ++j;
      }
      await Future.delayed(const Duration(microseconds: 900));
      setState(() {});

      ++k;
    }

    if (i > mid) {
      while (j <= high) {
        newList[k] = list[j];
        ++k;
        ++j;
        await Future.delayed(const Duration(microseconds: 900));
        setState(() {});
      }
    } else {
      while (i <= mid) {
        newList[k] = list[i];
        ++k;
        ++i;
        await Future.delayed(const Duration(microseconds: 900));
        setState(() {});
      }
    }
    for (k = low; k <= high; ++k) {
      list[k] = newList[k];
      await Future.delayed(const Duration(microseconds: 900));
      setState(() {});
    }
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
        title: const Text('Merge Sort'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(RouteManager.homePage);
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
