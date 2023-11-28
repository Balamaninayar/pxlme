import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pxlme/config/themes/app_colors.dart';
import 'package:pxlme/core/constants/list_constants.dart';
import 'package:pxlme/presentation/widgets/app_widgets.dart';
import 'package:pxlme/presentation/widgets/image_grid.dart';

import 'dialogbox/searchfilters.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _textController = TextEditingController();
  List<String> _filteredSuggestions = [];

  final FocusNode _focusNode = FocusNode();

  bool isChosen = false;

  List<String> suggestions = const [
    "Apple",
    "Ant",
    "Banana",
    "Cherry",
    "Date",
    "Elderberry",
    "Fig",
    "Grape",
    "Honeydew"
  ];

  InputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryDarkColor),
  );

  @override
  void initState() {
    super.initState();
  }

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = query.isNotEmpty
          ? suggestions
              .where((suggestion) =>
                  suggestion.toLowerCase().startsWith(query.toLowerCase()))
              .toList()
          : [];
    });
  }

  void _clearFocus() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [searchField(context), searchedBody()],
          ),
        ));
  }

  Container searchField(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // color: AppColors.appBackgroundColors,
        color: const Color(0xFFF2F2F2),
      ),
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: context.width * 0.8,
            height: 50,
            child: TextField(
              controller: _textController,
              onChanged: (query) {
                _filterSuggestions(query);
                onTextChanged(query);
              },
              onSubmitted: (query) {
                setState(() {
                  _clearFocus();
                  isChosen = true;
                  _filteredSuggestions.clear();
                });
              },
              focusNode: _focusNode,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search photos, collections and artists",
                  hintStyle:
                      const TextStyle(color: Color(0xFFB3B3B3), fontSize: 15),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.primaryDarkColor,
                  ),
                  suffix: InkWell(
                    onTap: () {
                      _clearFocus();
                      setState(() {
                        isChosen = false;
                      });
                      _textController.clear();
                      _filterSuggestions('');
                      onTextChanged(
                          ''); // Callback to parent with an empty query
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.iconBackground,
                      radius: 10,
                      child: Icon(
                        Icons.close,
                        size: 15,
                        color: AppColors.appBackgroundColors,
                      ),
                    ),
                  )),
            ),
          ),
          IconButton(
            icon: const Icon(
              LineIcons.filter,
              size: 35,
              color: AppColors.primaryDarkColor,
            ),
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: false,
                pageBuilder: (context, __, ___) {
                  return const SearchFiltersDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget searchedBody() {
    if (isChosen) {
      return const Expanded(
        child: SingleChildScrollView(
          child:
              ImageGridView(title: "Search results", textColor: Colors.black),
        ),
      );
    }
    if (_filteredSuggestions.isNotEmpty && _focusNode.hasFocus) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _filteredSuggestions.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      _filteredSuggestions[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      setState(() {
                        _clearFocus();
                        _textController.text = _filteredSuggestions[index];
                        _filteredSuggestions.clear();
                        isChosen = true;
                      });
                      // _filterSuggestions(_filteredSuggestions[index]);
                      // widget.onSuggestionSelected(_filteredSuggestions[
                      //     index]); // Callback to parent with the selected suggestion
                    },
                  ),
                ),
                Container(
                  height: .8,
                  color: Theme.of(context).iconTheme.color,
                )
              ],
            ),
          );
        },
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.titleWidget("Trending"),
        AppWidgets.tags(
            tags: ListConstants.categoryOptions,
            backGroundColor: Theme.of(context).primaryColor),
      ],
    );
  }

  void onTextChanged(String query) {}
}
