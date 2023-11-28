import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxlme/config/themes/app_colors.dart';

import '../../core/constants/routes_constant.dart';

class AppWidgets {
  static Widget orWidget(BuildContext context) {
    Container container = Container(
      width: context.width * 0.3,
      color: Colors.white,
      height: 2,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        container,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "OR",
            style: TextStyle(color: Colors.white),
          ),
        ),
        container
      ],
    );
  }

  static Widget verticalSpace(int length) {
    return SizedBox(
      height: (10 * length).toDouble(),
    );
  }

  static Widget displayImages(
      {String? imageUrl, String? title, BuildContext? context}) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesConstants.imageDetail);
        // Get.offNamed(RoutesConstants.imageDetail);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl!), fit: BoxFit.fill)),
              height: context!.height * 0.62,
            ),
            ListTile(
              title:
                  Text(title!, style: Theme.of(context).textTheme.titleMedium),
              trailing: Transform.rotate(
                angle: -70,
                child: Icon(
                  Icons.arrow_downward,
                  size: 30,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColors.primaryDarkColor,
            )
          ],
        ),
      ),
    );
  }

  static titleWidget(String title) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 30),
        ));
  }

  static Widget tags(
      {Color? backGroundColor,
      Color? textColor = Colors.white,
      Color? borderColor = Colors.white,
      List<String>? tags}) {
    return Wrap(
      children: List.generate(
          tags!.length,
          (index) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: borderColor!)),
                child: Text(
                  tags[index],
                  style: TextStyle(color: textColor!),
                ),
              )),
    );
  }
}
