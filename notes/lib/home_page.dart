import 'package:flutter/material.dart';
import 'package:notes/feauters/notes/presentation/pages/view_notes/view_notes_page.dart';
import 'package:notes/feauters/tasks/presentation/pages/view_tasks/view_tasks_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NotesPageView(),
    ViewTasksPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 53, 48, 48),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Заметки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Задачи',
          ),
        ],
      ),
    );
  }
}
