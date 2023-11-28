import 'package:flutter/material.dart';
import 'package:pxlme/core/constants/list_constants.dart';

import '../../config/themes/app_colors.dart';

class CategoryOptions extends StatefulWidget {
  const CategoryOptions({Key? key}) : super(key: key);

  @override
  State<CategoryOptions> createState() => _CategoryOptionsState();
}

class _CategoryOptionsState extends State<CategoryOptions> {
  String chosenOption = ListConstants.categoryOptions.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: ListConstants.categoryOptions.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final bool isChosenOption =
              ListConstants.categoryOptions[index] == chosenOption;
          return InkWell(
            onTap: () {
              setState(() {
                chosenOption = ListConstants.categoryOptions[index];
              });
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                          ListConstants.categoryOptions[index].toUpperCase()),
                    ),
                    Container(
                      width: ListConstants.categoryOptions[index].length
                              .toDouble() *
                          16,
                      height: 1.5,
                      color: AppColors.primaryDarkColor
                          .withOpacity(isChosenOption ? 1 : 0.5),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12.5),
                      width: ListConstants.categoryOptions[index].length
                              .toDouble() *
                          16,
                      height: isChosenOption ? 3 : 1.5,
                      color: AppColors.primaryDarkColor
                          .withOpacity(isChosenOption ? 1 : 0.5),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
