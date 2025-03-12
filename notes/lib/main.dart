import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:notes/Notes/add_note.dart';
import 'package:notes/Task/add_task.dart';

import 'package:notes/home_notes_list_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesMeneger()),
        ChangeNotifierProvider(create: (context) => TaskManager()),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const NotesListScreen(),
    );
  }
}
