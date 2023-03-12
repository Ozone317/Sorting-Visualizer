import 'package:flutter/material.dart';
import 'package:sorting_visualizer/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(1000, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.bubbleSort);
                },
                child: const Text('Bubble sort'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(1000, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.selectionSort);
                },
                child: const Text('Selection sort'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(1000, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.insertionSort);
                },
                child: const Text('Insertion sort'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(1000, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.quickSort);
                },
                child: const Text('Quick sort'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(1000, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.mergeSort);
                },
                child: const Text('Merge sort'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
