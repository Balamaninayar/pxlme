import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxlme/core/constants/routes_constant.dart';
import 'package:pxlme/presentation/widgets/app_widgets.dart';

import '../widgets/category_section.dart';
import '../widgets/image_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [_searchButton(), _exploringContent()],
        ),
      ),
    );
  }

  Expanded _exploringContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CategorySection(
              title: "Browse by category",
            ),
            AppWidgets.verticalSpace(2),
            const CategorySection(
              title: "Moods and genres",
            ),
            AppWidgets.verticalSpace(2),
            const ImageGridView(
              title: "Trending artists",
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Container _searchButton() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: AppColors.appBackgroundColors,
          color: const Color(0xFFF2F2F2),
        ),
        // border: Border.all(color: AppColors.primaryDarkColor)),
        height: 50,
        child: ListTile(
            onTap: () {
              Get.toNamed(RoutesConstants.searchField);
            },
            leading: const Icon(
              Icons.search,
              color: Color(0xFFB3B3B3),
            ),
            title: const Text(
              "Search phots, collections, artists...",
              style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 16),
            )));
  }
}
