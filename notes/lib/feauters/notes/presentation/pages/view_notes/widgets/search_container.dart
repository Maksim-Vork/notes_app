import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  final TextEditingController findController;
  const SearchContainer({super.key, required this.findController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 87, 80, 80),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 24,
                  color: Color.fromARGB(255, 194, 194, 194),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  controller: findController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Поиск заметок',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 171, 168, 168),
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
