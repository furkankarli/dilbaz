import 'package:dilbaz/navbar/navbar.dart';
import 'package:dilbaz/pages/home.dart';
import 'package:dilbaz/pages/notepad.dart';
import 'package:dilbaz/pages/ocr.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(
      name: navbar,
      page: () => const NavBar(),
    ),
    GetPage(
      name: home,
      page: () => const Home(),
    ),
    GetPage(
      name: ocr,
      page: () => const Ocr(),
    ),
    GetPage(
      name: notepad,
      page: () => const NotePad(),
    ),
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getocr() => ocr;
  static getnotepad() => notepad;

  static String navbar = '/';
  static String home = '/home';
  static String ocr = '/ocr';
  static String notepad = '/notepad';
}
