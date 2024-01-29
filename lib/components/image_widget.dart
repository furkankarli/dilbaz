import 'package:flutter/material.dart';

Widget imagePickAlert({
  void Function()? onCameraPressed,
  void Function()? onGalleryPressed,
}) {
  return AlertDialog(
    title: const Text(
      "Bir kaynak seçin:",
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text(
            "Kamera",
          ),
          onTap: onCameraPressed,
        ),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text(
            "Galeri",
          ),
          onTap: onGalleryPressed,
        ),
      ],
    ),
  );
}
