import 'package:flutter/material.dart';
import 'package:sorting_visualizer/pages/bubble_sort.dart';
import 'package:sorting_visualizer/pages/home_page.dart';
import 'package:sorting_visualizer/pages/insertion_sort.dart';
import 'package:sorting_visualizer/pages/merge_sort.dart';
import 'package:sorting_visualizer/pages/quick_sort.dart';
import 'package:sorting_visualizer/pages/selection_sort.dart';

class RouteManager {
  static const String homePage = '/';
  static const String bubbleSort = 'bubbleSort/';
  static const String selectionSort = 'selectionSort';
  static const String insertionSort = '/insertionSort';
  static const String quickSort = '/quickSort';
  static const String mergeSort = '/mergeSort';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case bubbleSort:
        return MaterialPageRoute(
          builder: (context) => const BubbleSort(),
        );
      case selectionSort:
        return MaterialPageRoute(
          builder: (context) => const SelectionSort(),
        );
      case insertionSort:
        return MaterialPageRoute(
          builder: (context) => const InsertionSort(),
        );
      case quickSort:
        return MaterialPageRoute(
          builder: (context) => const QuickSort(),
        );
      case mergeSort:
        return MaterialPageRoute(
          builder: (context) => const MergeSort(),
        );
      default:
        throw Exception('Route not found. Check route name and try again');
    }
  }
}
