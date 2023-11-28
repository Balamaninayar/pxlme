import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import 'home_page.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final List<XFile> _selectedImages = [];
  final List<File> _editedImages = [];
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickMultipleImages() async {
    final images = await _imagePicker.pickMultiImage();
    setState(() {
      _selectedImages.addAll(images);
    });
  }

  Future<void> _editImage(int index) async {
    final XFile selectedImage = _selectedImages[index];

    // Load the selected image
    final img.Image image =
        img.decodeImage(File(selectedImage.path).readAsBytesSync())!;

    // Perform editing operations (e.g., adjust brightness, contrast, apply filters)

    // Display the image in a cropping view

    final croppedImage = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageEditorPage(image: image),
      ),
    );

    if (croppedImage != null) {
      _editedImages[index] = croppedImage;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _pickMultipleImages,
        label: Row(
          children: const [
            Text("Upload Image"),
            Icon(Icons.add),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Pxl Me",
          style: TextStyle(color: Theme.of(context).iconTheme.color),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _selectedImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _editImage(index),
            child: _editedImages.length > index
                ? Image.file(_editedImages[index])
                : Image.file(File(_selectedImages[index].path)),
          );
        },
      ),
    );
  }
}
