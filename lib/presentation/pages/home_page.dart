import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';

import '../../core/constants/list_constants.dart';
import '../widgets/app_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Pxl Me",
          style: TextStyle(color: Theme.of(context).iconTheme.color),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: ListConstants.dummyImages.length,
        itemBuilder: (BuildContext context, int index) {
          return AppWidgets.displayImages(
              title: "Shaurya",
              context: context,
              imageUrl: ListConstants.dummyImages[index]);
        },
      ),
    );
  }
}

class ImageEditorPage extends StatefulWidget {
  final img.Image image;

  const ImageEditorPage({super.key, required this.image});

  @override
  _ImageEditorPageState createState() => _ImageEditorPageState();
}

class _ImageEditorPageState extends State<ImageEditorPage> {
  img.Image? editedImage;

  int brightness = 0;
  @override
  void initState() {
    super.initState();
    editedImage = widget.image;
    log(editedImage!.exif.toString());
  }

  Future<void> _cropAndSaveImage() async {
    // Perform additional editing operations if needed
    final editedImagePath = await saveEditedImage(editedImage!);

    Navigator.pop(context, File(editedImagePath));
  }

  void applyFilter() {
    // editedImage = editedImage!;

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Editor"),
      ),
      body: Column(
        children: [
          Expanded(
            child: PhotoView(
              imageProvider:
                  MemoryImage(Uint8List.fromList(img.encodePng(editedImage!))),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ),
          Slider(
            value: brightness.toDouble(),
            min: -255,
            max: 255,
            onChanged: (value) {
              setState(() {
                brightness = value.round();
                applyFilter();
              });
            },
          ),
          ElevatedButton(
            onPressed: _cropAndSaveImage,
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Future<String> saveEditedImage(img.Image image) async {
    final tempDir = await getTemporaryDirectory();
    final file =
        File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png');
    await file.writeAsBytes(img.encodePng(image));
    return file.path;
  }
}
