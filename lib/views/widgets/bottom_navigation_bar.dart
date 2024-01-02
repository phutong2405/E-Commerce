import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar(
    {required BuildContext context,
    required int selectedPage,
    required Function(int index) func}) {
  return Theme(
    data: ThemeData(
      canvasColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.95),
    ),
    child: BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedPage,
      onTap: (index) {
        func(index);
      },
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      items: bottomNavigationBarItem(context: context),
    ),
  );
}

List<BottomNavigationBarItem> bottomNavigationBarItem(
    {required BuildContext context}) {
  return [
    BottomNavigationBarItem(
        activeIcon: const Icon(
          CupertinoIcons.today,
          color: Colors.white,
        ),
        icon: Icon(
          CupertinoIcons.today_fill,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        activeIcon: const Icon(
          CupertinoIcons.square_fill_on_circle_fill,
          color: Colors.deepPurple,
        ),
        icon: Icon(
          CupertinoIcons.square_on_circle,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        label: "About"),
    BottomNavigationBarItem(
        activeIcon: const Icon(
          Icons.local_movies,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.local_movies,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        label: "Product"),
    BottomNavigationBarItem(
        activeIcon: const Icon(
          Icons.shopping_bag,
          color: Colors.blue,
        ),
        icon: Icon(
          Icons.shopping_bag_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        label: "Contact"),
  ];
}
