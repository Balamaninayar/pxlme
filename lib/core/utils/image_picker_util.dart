
// class MultiImagePicker {
//   final ImagePicker _picker = ImagePicker();

//   Future<List<XFile>> pickImages() async {
//     List<XFile> images = [];
    
//     try {
//       final result = await _picker.pickMultiImage(
//         imageQuality: 50, // Adjust image quality as needed
//         maxWidth: 800, // Adjust maximum width as needed
//       );

//       if (result != null) {
//         images = result;
//       }
//     } catch (e) {
//       print("Error picking images: $e");
//     }

//     return images;
//   }
// }