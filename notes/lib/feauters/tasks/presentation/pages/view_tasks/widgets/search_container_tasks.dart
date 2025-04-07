import 'package:flutter/material.dart';

class SearchContainerTasks extends StatelessWidget {
  final TextEditingController findTaskController;
  const SearchContainerTasks({super.key, required this.findTaskController});

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
                  controller: findTaskController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Поиск задач',
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
