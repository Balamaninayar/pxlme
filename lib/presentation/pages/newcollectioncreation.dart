import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxlme/presentation/widgets/app_widgets.dart';

class CreateCollection extends StatefulWidget {
  const CreateCollection({Key? key}) : super(key: key);

  @override
  State<CreateCollection> createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<CreateCollection> {
  bool isNewCollectionFormView = false;
  bool isPrivateCollection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.8),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          height: context.height * 0.9,
          width: context.width * 0.9,
          padding: EdgeInsets.symmetric(horizontal: context.width * .08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.verticalSpace(4),
              buildCloseActions(),
              buildCreateNewCollection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCreateNewCollection(BuildContext context) {
    if (isNewCollectionFormView) {
      return buildCollectionForm();
    }
    return buildCollectionView(context);
  }

  Widget buildCollectionForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.verticalSpace(5),
        const Text(
          "Create New Collection",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 22),
        ),
        AppWidgets.verticalSpace(5),
        Container(
          height: 52,
          width: context.width * 0.7,
          color: Colors.white.withOpacity(0.4000000059604645),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Collection Name",
              hintStyle: TextStyle(fontSize: 17, color: Colors.white38),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
        ),
        AppWidgets.verticalSpace(3),
        Container(
          height: 160,
          width: context.width * 0.7,
          color: Colors.white.withOpacity(0.4000000059604645),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const TextField(
            style: TextStyle(color: Colors.white),
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              hintText: "Description (Optional)",
              hintStyle: TextStyle(fontSize: 17, color: Colors.white38),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
        ),
        AppWidgets.verticalSpace(3),
        Container(
            height: 52,
            width: context.width * 0.7,
            color: Colors.white.withOpacity(0.4000000059604645),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Private",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 22),
                ),
                CupertinoSwitch(
                  value: isPrivateCollection,
                  onChanged: (value) {
                    isPrivateCollection = value;
                    setState(
                      () {},
                    );
                  },
                  thumbColor: CupertinoColors.white,
                  activeColor: CupertinoColors.activeGreen,
                ),
              ],
            )),
        AppWidgets.verticalSpace(3),
        InkWell(
          onTap: () {},
          child: Container(
            color: Colors.white,
            width: context.width * 0.7,
            height: 65,
            child: const Center(
              child: Text(
                "Create New Collection",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildCollectionView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.verticalSpace(5),
        const Text(
          "Save to Collection",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 22),
        ),
        AppWidgets.verticalSpace(5),
        InkWell(
          onTap: () {
            setState(() {
              isNewCollectionFormView = true;
            });
          },
          child: Container(
            color: Colors.white,
            width: context.width * 0.7,
            height: 65,
            child: const Center(
              child: Text(
                "Create New Collection",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        AppWidgets.verticalSpace(4),
        const Text(
          "Your Collections",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 22),
        ),
        AppWidgets.verticalSpace(3),
        const Text(
          "You don’t have any collections yet.\nCreate a new collection to get started.",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 17),
        ),
      ],
    );
  }

  Widget buildCloseActions() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Text(
        "close".toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.28,
        ),
      ),
    );
  }
}
