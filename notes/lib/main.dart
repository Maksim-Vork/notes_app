import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:notes/feauters/auntification/presentation/screen/login_screen.dart';
import 'package:notes/feauters/notes/data/repository/notes_repository_impl.dart';
import 'package:notes/feauters/notes/data/sources/local_data_sources.dart';
import 'package:notes/feauters/notes/domain/usecase/get_notes_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/save_note_usecase.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_bloc.dart';
import 'package:notes/feauters/tasks/data/repository/task_repository_impl.dart';
import 'package:notes/feauters/tasks/data/sources/local_data_cources.dart';
import 'package:notes/feauters/tasks/domain/usecase/get_tasks_usecase.dart';
import 'package:notes/feauters/tasks/domain/usecase/save_task_usecase.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:notes/firebase_options.dart';

import 'package:notes/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sourcesNotes = LocalDataSources();
  final repositoryNotes = NotesRepositoryImpl(sourcesNotes);
  final saveNote = SaveNoteUsecase(repositoryNotes);
  final getNotes = GetNotesUsecase(repositoryNotes);

  final sourcesTasks = LocalDataCources();
  final repositoryTasks = TaskRepositoryImpl(sourcesTasks);
  final getTasks = GetTasksUsecase(repositoryTasks);
  final saveTask = SaveTaskUsecase(repositoryTasks);

  runApp(
    SafeArea(
      child: MyApp(
        saveNote: saveNote,
        getNotes: getNotes,
        getTasks: getTasks,
        saveTask: saveTask,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SaveNoteUsecase saveNote;
  final GetNotesUsecase getNotes;
  final GetTasksUsecase getTasks;
  final SaveTaskUsecase saveTask;

  const MyApp({
    super.key,
    required this.saveNote,
    required this.getNotes,
    required this.getTasks,
    required this.saveTask,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc(getNotes, saveNote),
        ),
        BlocProvider<TasksBloc>(
          create: (context) => TasksBloc(getTasks, saveTask),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,

        home: const LoginScreen(),
        //HomePage
      ),
    );
  }
}
