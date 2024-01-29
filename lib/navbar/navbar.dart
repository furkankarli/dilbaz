import 'package:dilbaz/controller/controller.dart';
import 'package:dilbaz/pages/home.dart';
import 'package:dilbaz/pages/notepad.dart';
import 'package:dilbaz/pages/ocr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            Home(),
            Ocr(),
            NotePad(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: [
            _bottombarItem(IconlyBold.home, 'Traslate'),
            _bottombarItem(IconlyBold.document, 'OCR'),
            _bottombarItem(IconlyBold.edit, 'NotePad'),
          ],
        ),
      );
    });
  }
}

// ignore: unused_element
_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
