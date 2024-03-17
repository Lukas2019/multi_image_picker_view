import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/src/image_file.dart';

class ErrorPreview extends StatelessWidget {
  final ImageFile imageFile;
  final Color? backgroundColor;

  const ErrorPreview(
      {super.key, required this.imageFile, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          backgroundColor ?? Theme.of(context).colorScheme.secondaryContainer,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getIcon(),
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            const SizedBox(height: 4),
            Text(
              "${imageFile.name}\n",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (imageFile.extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
      case 'webp':
        return Icons.image;
      default:
        return Icons.find_in_page_rounded;
    }
  }
}
