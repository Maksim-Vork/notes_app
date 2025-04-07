import 'package:flutter/material.dart';
import 'package:notes/feauters/notes/presentation/pages/create_notes/widgets/app_bar.dart';

import 'package:notes/feauters/notes/presentation/pages/create_notes/widgets/description_field.dart';
import 'package:notes/feauters/notes/presentation/pages/create_notes/widgets/title_field.dart';
import 'package:intl/intl.dart';

class CreateNotesPage extends StatelessWidget {
  final DateTime currentTime;
  CreateNotesPage({super.key, required this.currentTime});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('d MMMM, HH:mm', 'ru_RU').format(currentTime);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 53, 48, 48),
        title: AppBarNotesCreate(
          titleController: _titleController,
          descriptionController: _descriptionController,
          timeCreated: currentTime,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFieldCreated(
                titleController: _titleController,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                formattedDate,
                style: TextStyle(
                    color: Color.fromARGB(255, 171, 168, 168), fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              DescriptionFieldCreated(
                descriptionController: _descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
