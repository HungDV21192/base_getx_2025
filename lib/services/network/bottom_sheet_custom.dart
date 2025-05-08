import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCustom extends StatelessWidget {
  const BottomSheetCustom({super.key, this.onGallery, this.onTakePhoto});
final VoidCallback? onGallery;
final VoidCallback? onTakePhoto;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('gallery'.tr),
                leading: const Icon(Icons.image_outlined),
                onTap: onGallery,
              ),
              ListTile(

                title: Text('take_photo'.tr),
                leading: const Icon(Icons.camera_alt_outlined),
                onTap: onTakePhoto,
              ),
            ],
          ),
        ),);
  }
}
