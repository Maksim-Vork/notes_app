import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

class SearchContainer extends StatelessWidget {
  final TextEditingController findController;
  const SearchContainer({super.key, required this.findController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.surfaceColor,
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
                  color: AppColors.searchColor,
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
                      color: AppColors.searchColor,
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
