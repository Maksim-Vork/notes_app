import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/auntification/data/datasource/remote_auth_datasource.dart';
import 'package:notes/feauters/auntification/data/repository/impl_auth_repository.dart';
import 'package:notes/feauters/auntification/domain/usecase/check_auth_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/login_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/register_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/sign_out_usecase.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_bloc.dart';
import 'package:notes/feauters/auntification/presentation/screen/login_screen.dart';
import 'package:notes/feauters/notes/data/repository/notes_repository_impl.dart';
import 'package:notes/feauters/notes/data/sources/remote_data_sources.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';
import 'package:notes/feauters/notes/domain/usecase/add_note_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/delete_note_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/get_notes_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/update_note_usecase.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_bloc.dart';
import 'package:notes/feauters/tasks/data/repository/task_repository_impl.dart';
import 'package:notes/feauters/tasks/data/sources/local_data_cources.dart';
import 'package:notes/feauters/tasks/domain/usecase/get_tasks_usecase.dart';
import 'package:notes/feauters/tasks/domain/usecase/save_task_usecase.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:notes/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sourcesTasks = LocalDataCources();
  final repositoryTasks = TaskRepositoryImpl(sourcesTasks);
  final getTasks = GetTasksUsecase(repositoryTasks);
  final saveTask = SaveTaskUsecase(repositoryTasks);

  final remoteAuthDataSource = RemoteAuthDatasource();
  final auntificationRepository =
      ImplAuthRepository(remoteAuthDataSource: remoteAuthDataSource);
  final loginUsecase =
      LoginUsecase(auntificationRepository: auntificationRepository);
  final registerUsecase =
      RegisterUsecase(auntificationRepository: auntificationRepository);
  final checkAuthUsecase =
      CheckAuthUsecase(auntificationRepository: auntificationRepository);
  final signOutUsecase =
      SignOutUsecase(auntificationRepository: auntificationRepository);

  final RemoteDataSources remoteAuthDatasource = RemoteDataSources();
  final NotesRepository notesRepository =
      NotesRepositoryImpl(remoteAuthDatasource);
  final AddNoteUsecase addNoteUsecase =
      AddNoteUsecase(repository: notesRepository);
  final DeleteNoteUsecase deleteNoteUsecase =
      DeleteNoteUsecase(repository: notesRepository);
  final GetNotesUsecase getNotesUsecase =
      GetNotesUsecase(repository: notesRepository);
  final UpdateNoteUsecase updateNoteUsecase =
      UpdateNoteUsecase(repository: notesRepository);

  runApp(
    SafeArea(
      child: MyApp(
        getTasks: getTasks,
        saveTask: saveTask,
        loginUsecase: loginUsecase,
        registerUsecase: registerUsecase,
        checkAuthUsecase: checkAuthUsecase,
        signOutUsecase: signOutUsecase,
        addNoteUsecase: addNoteUsecase,
        deleteNoteUsecase: deleteNoteUsecase,
        getNotesUsecase: getNotesUsecase,
        updateNoteUsecase: updateNoteUsecase,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final CheckAuthUsecase checkAuthUsecase;
  final SignOutUsecase signOutUsecase;

  final GetTasksUsecase getTasks;
  final SaveTaskUsecase saveTask;

  final AddNoteUsecase addNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;
  final GetNotesUsecase getNotesUsecase;
  final UpdateNoteUsecase updateNoteUsecase;

  const MyApp({
    super.key,
    required this.getTasks,
    required this.saveTask,
    required this.loginUsecase,
    required this.registerUsecase,
    required this.checkAuthUsecase,
    required this.signOutUsecase,
    required this.addNoteUsecase,
    required this.deleteNoteUsecase,
    required this.getNotesUsecase,
    required this.updateNoteUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(loginUsecase, registerUsecase,
                checkAuthUsecase, signOutUsecase)),
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc(addNoteUsecase, deleteNoteUsecase,
              getNotesUsecase, updateNoteUsecase),
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
