import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pxlme/config/themes/app_colors.dart';
import 'package:pxlme/core/constants/list_constants.dart';
import 'package:pxlme/presentation/widgets/image_grid.dart';

import '../../presentation/pages/newcollectioncreation.dart';
import '../widgets/app_widgets.dart';

class ImageDetailsPage extends StatefulWidget {
  const ImageDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  late String chosenImageUrl;

  bool isImageLiked = false;
  @override
  void initState() {
    super.initState();

    // final arguments = Get.arguments as Map<String, dynamic>;
    // chosenImageUrl = arguments['chosenImageUrl'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Shaurya",
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.upload,
              ),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.background),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.height * 0.65,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(ListConstants.dummyImages[2]))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primaryDarkColor,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        LineIcons.chromecast,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info,
                            color: Theme.of(context).iconTheme.color,
                          )),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                              onPressed: () {
                                showGeneralDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  pageBuilder: (context, __, ___) {
                                    return const CreateCollection();
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                size: 30,
                                color: Theme.of(context).iconTheme.color,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isImageLiked = !isImageLiked;
                                });
                              },
                              icon: Icon(
                                LineIcons.heartAlt,
                                size: 30,
                                color: isImageLiked
                                    ? Colors.red
                                    : Theme.of(context).iconTheme.color,
                              )),
                        ),
                      ],
                    )
                  ]),
            ),
            AppWidgets.tags(
                backGroundColor: Theme.of(context).primaryColor,
                tags: [
                  ListConstants.categoryOptions.first,
                  ListConstants.categoryOptions.last,
                  ListConstants.categoryOptions[3],
                  ListConstants.categoryOptions[6],
                  ListConstants.categoryOptions.last
                ]),
            const ImageGridView(
              title: "More like this",
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
