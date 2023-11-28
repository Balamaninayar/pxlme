import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxlme/presentation/widgets/app_widgets.dart';

class SearchFiltersDialog extends StatefulWidget {
  const SearchFiltersDialog({Key? key}) : super(key: key);

  @override
  State<SearchFiltersDialog> createState() => SearchFiltersDialogState();
}

class SearchFiltersDialogState extends State<SearchFiltersDialog> {
  List<String> orientations = ["All Orientations", "Portraits", "Landscape"];
  List<String> sizes = ["All Size", "Large", "Medium", "Small"];
  List<String> colors = [
    "All Colors",
    "Red",
    "Yellow",
    "Green",
    "Blue",
    "Orange"
  ];

  static Map<String, Color> colorMap = {
    "Red": Colors.red,
    "Yellow": Colors.yellow,
    "Green": Colors.green,
    "Blue": Colors.blue,
    "Orange": Colors.orange,
  };

  Map<String, String>? filters;
  @override
  void initState() {
    super.initState();
    resetFilters();
  }

  void resetFilters() {
    setState(() {
      filters = {
        "Orientation": orientations.first,
        "Sizes": sizes.first,
        "Colors": colors.first
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    Container horizontalLine = Container(
      height: 1,
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          // width: context.width * 0.9,
          height: context.height * .9,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.verticalSpace(2),
                buildCloseActions(),
                AppWidgets.verticalSpace(2),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      buildFilters("Orientation", orientations),
                      horizontalLine,
                      buildFilters("Sizes", sizes),
                      horizontalLine,
                      buildFilters("Colors", colors),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCloseActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            "close".toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF2B2A29),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.28,
            ),
          ),
        ),
        InkWell(
          onTap: resetFilters,
          child: Row(
            children: [
              const Icon(Icons.close),
              Text(
                "clear".toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF2B2A29),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildFilters(String title, List<String> filter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        AppWidgets.verticalSpace(1),
        ...List.generate(
            filter.length,
            (index) => InkWell(
                  onTap: () {
                    setState(() {
                      filters![title] = filter[index];
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          title == "Colors" && filter[index] != "All Colors"
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: colorMap[filter[index]],
                                  ),
                                )
                              : const SizedBox(),
                          Text(
                            filter[index],
                            style: const TextStyle(
                              color: Color(0xFF2B2A29),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: filters![title] == filter[index]
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: const Icon(
                                    Icons.check,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      )
                    ],
                  ),
                ))
      ],
    );
  }
}
