// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FilterImageScreen extends StatefulWidget {
  const FilterImageScreen({super.key});

  @override
  State<FilterImageScreen> createState() => _FilterImageScreenState();
}

class _FilterImageScreenState extends State<FilterImageScreen> {
  late File _imageFile;
  late img.Image _editedImage;
  int _selectedFilter = 0;

  img.Image? originalImage;
  img.Image? filteredImage;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = File(pickedFile.path).readAsBytesSync();
      final image = img.decodeImage(Uint8List.fromList(imageBytes));

      setState(() {
        _imageFile = File(pickedFile.path);
        _editedImage = img.copyResize(image!, width: 400); // Resize for display
      });
    }
  }

  void _applyFilter(int? filterType) {
    if (_editedImage != null) {
      setState(() {
        _selectedFilter = filterType!;
        _editedImage = _applySomeFilter(_editedImage, filterType);
      });
    }
  }

  img.Image _applySomeFilter(img.Image image, int filterType) {
    switch (filterType) {
      case 0:
        // Original image, no filter
        return image.clone();

      case 1:
        // Grayscale filter
        return img.grayscale(image);

      // case 2:
      //   // Sepia filter
      //   return img.colorMatrix(image, img.sepia);

      case 3:
        // Invert filter
        return img.invert(image);

      case 4:
        // Blur filter
        return img.gaussianBlur(image, 5); // Adjust the blur radius as needed

      // case 5:
      //   // Sharpen filter
      //   return img.unsharpMask(image, 5, 1.0, 0);

      case 6:
        // Adjust brightness
        return img.adjustColor(image, brightness: 1.5);

      case 7:
        // Adjust contrast
        return img.adjustColor(image, contrast: 1.5);

      // case 8:
      //   // Hue rotation filter
      //   return img.colorMatrix(
      //       image, img.hue(-45)); // Rotate hue by -45 degrees

      // case 9:
      //   // Saturation filter
      //   return img.colorMatrix(
      //       image, img.saturation(2.0)); // Double the saturation

      default:
        return image.clone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Filter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick an Image'),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: _editedImage != null
                  ? Image.memory(
                      Uint8List.fromList(img.encodePng(_editedImage)))
                  : Image.file(_imageFile),
            ),
            const SizedBox(height: 20),
            const Text('Select a Filter:'),
            DropdownButton<int>(
              value: _selectedFilter,
              items: const [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text('None'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Grayscale'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Sepia'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('Invert'),
                ),
                DropdownMenuItem<int>(
                  value: 4,
                  child: Text('Blur'),
                ),
                DropdownMenuItem<int>(
                  value: 5,
                  child: Text('Sharpen'),
                ),
                DropdownMenuItem<int>(
                  value: 6,
                  child: Text('Brightness'),
                ),
                DropdownMenuItem<int>(
                  value: 7,
                  child: Text('Contrast'),
                ),
                DropdownMenuItem<int>(
                  value: 8,
                  child: Text('Hue Rotation'),
                ),
                DropdownMenuItem<int>(
                  value: 9,
                  child: Text('Saturation'),
                ),
              ],
              onChanged: _applyFilter,
            ),
          ],
        ),
      ),
    );
  }
}
