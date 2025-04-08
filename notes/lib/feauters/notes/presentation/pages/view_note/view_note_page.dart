import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';

import 'package:notes/feauters/notes/presentation/pages/view_note/widgets/app_bar_note_view.dart';
import 'package:notes/feauters/notes/presentation/pages/view_note/widgets/description_field_view.dart';
import 'package:notes/feauters/notes/presentation/pages/view_note/widgets/title_field_view.dart';

// ignore: must_be_immutable
class ViewNotePage extends StatelessWidget {
  final Note note;
  ViewNotePage({
    super.key,
    required this.note,
  });
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController = TextEditingController(text: note.title);
    _descriptionController = TextEditingController(text: note.description);
    final DateTime dataCreated = note.timeCreated;
    String formattedDate =
        DateFormat('d MMMM, HH:mm', 'ru_RU').format(dataCreated);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarAndBottomColor,
        title: AppBarNoteView(
          note: note,
          titleController: _titleController,
          descriptionController: _descriptionController,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFieldView(
                titleControllerView: _titleController,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                formattedDate,
                style: TextStyle(color: AppColors.searchColor, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              DescriptionFieldView(
                descriptionControllerView: _descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
