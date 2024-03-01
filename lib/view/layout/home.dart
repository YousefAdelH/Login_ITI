import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widget/home_layout.dart';
import 'package:flutter_application_1/view/screens/call.dart';
import 'package:flutter_application_1/view/screens/chat.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List<Widget> screens = [ChatUser(), Chat(), Call()];
  List<String> textappbar = [
    'Home',
    'Chat',
    "Call",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: screens[_selectedIndex],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`

              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            backgroundColor: Colors.blueAccent,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color.fromARGB(255, 235, 237, 240),
            showSelectedLabels: true,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'call',
              ),
            ],
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
