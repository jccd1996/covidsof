import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'countries_page.dart';
import 'local_info_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _loadPages();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)),
      home: Scaffold(
        backgroundColor: Colors.orange[800],
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (page) {
            _onItemTapped(page);
          },
          backgroundColor: Colors.grey[300],
          selectedItemColor: Colors.orange[800],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              title: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  void _loadPages() {
    pages = [];
    pages.add(LocalInfoPage());
    pages.add(CountriesPage());
  }

  void _onItemTapped(int page) {
    setState(() {
      currentPage = page;
    });
  }
}
