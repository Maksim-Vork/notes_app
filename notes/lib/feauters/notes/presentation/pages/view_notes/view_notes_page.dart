import 'package:flutter/material.dart';

class NotesPageView extends StatelessWidget {
  NotesPageView({super.key});
  final TextEditingController _findController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.create_new_folder,
                  size: 35,
                )),
            Text(
              'Заметки',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 35,
                )),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 87, 80, 80),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _findController,
                          decoration: InputDecoration(
                              hintText: 'Поиск заметок',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 171, 168, 168),
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
