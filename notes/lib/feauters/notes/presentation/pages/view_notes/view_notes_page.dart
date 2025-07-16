import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_bloc.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_event.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_state.dart';
import 'package:notes/feauters/notes/presentation/pages/create_notes/create_notes_page.dart';
import 'package:notes/feauters/notes/presentation/pages/view_notes/widgets/grid_view_notes.dart';
import 'package:notes/feauters/notes/presentation/pages/view_notes/widgets/app_bar.dart';
import 'package:notes/feauters/notes/presentation/pages/view_notes/widgets/search_container.dart';

class NotesPageView extends StatefulWidget {
  const NotesPageView({super.key});

  @override
  State<NotesPageView> createState() => _NotesPageViewState();
}

class _NotesPageViewState extends State<NotesPageView> {
  final TextEditingController _findController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesBloc>(context).add(GetNotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: AppColors.floatingActionButtonColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CreateNotesPage(
                          currentTime: DateTime.now(),
                        )));
          },
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: AppColors.appBarAndBottomColor,
          title: AppBarNotesView()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            SearchContainer(findController: _findController),
            SizedBox(height: 25),
            BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                return GridViewNotes(notesState: state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
