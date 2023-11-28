import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pxlme/config/app_theme.dart';
import 'package:pxlme/config/themes/app_colors.dart';
import 'package:pxlme/presentation/widgets/app_widgets.dart';

import '../../core/constants/list_constants.dart';
import '../widgets/collectionsgrid.dart';
import '../widgets/customsigninbutton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isThemeChanged = false;

  List<String> tabs = ['Photos', 'Likes', 'Collections'];

  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: const Icon(
          LineIcons.infoCircle,
          color: Colors.white,
        ),
        actions: [
          CupertinoSwitch(
              value: isThemeChanged,
              activeColor: Colors.green,
              onChanged: (changeValue) {
                setState(() {
                  isThemeChanged = changeValue;
                  if (changeValue) {
                    AppTheme.changeThemeMode(ThemeMode.light);
                  } else {
                    AppTheme.changeThemeMode(ThemeMode.dark);
                  }
                });
              }),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.settings_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          buildProfileHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [buildTabView(), buildTabsBodyView()],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildProfileHeader() {
    return Container(
      height: context.height * .2,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Shaurya",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTabView() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: context.width * 0.9,
      height: 60,
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: List.generate(
            tabs.length,
            (index) => InkWell(
                onTap: () {
                  setState(() {
                    currentTab = index;
                  });
                },
                child: buildTabTile(tabs[index], index == currentTab))),
      ),
    );
  }

  Widget buildTabTile(String title, bool isChosen) {
    return Container(
      width: context.width * 0.3,
      height: 60,
      decoration: ShapeDecoration(
        color: isChosen ? Colors.white : const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: isChosen ? 1 : 0,
              color:
                  isChosen ? const Color(0xFFB3B3B3) : const Color(0xFFF2F2F2)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color:
              isChosen ? AppColors.primaryBlueColor : const Color(0xFFB3B3B3),
          fontSize: 17,
          fontFamily: 'Helvetica Neue',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildTabsBodyView() {
    if (currentTab == 0) {
      return buildPhotosView();
    }
    if (currentTab == 1) {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  ListConstants.dummyImages.length,
                  (index) => AppWidgets.displayImages(
                      title: "Shaurya",
                      context: context,
                      imageUrl: ListConstants.dummyImages[index]))),
        ),
      );
    }
    if (currentTab == 2) {
      return const Expanded(
          child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: CollectionGrid(),
      ));
    }
    return Container();
  }

  Widget buildPhotosView() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Upload your own photos and cast\ndirectly to any smart device.",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
                "Keep photos private or share with\nfriends and family.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium),
          ),
          CustomButton(
            title: "Upload Photos",
            onPressed: () {},
            backGroundColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
