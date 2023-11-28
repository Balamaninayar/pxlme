import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pxlme/core/constants/list_constants.dart';

class ImageGridView extends StatefulWidget {
  const ImageGridView({Key? key, required this.title, required this.textColor})
      : super(key: key);
  final String title;
  final Color textColor;
  @override
  State<ImageGridView> createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            itemCount: ListConstants.dummyImages.length,
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      ListConstants.dummyImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Shaurya",
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
