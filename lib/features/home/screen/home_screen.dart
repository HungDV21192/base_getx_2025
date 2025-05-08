import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/features/home/controller/home_controller.dart';
import 'package:base_getx_2025/features/home/widgets/BluePage.dart';
import 'package:base_getx_2025/features/home/widgets/RedPage.dart';
import 'package:base_getx_2025/services/network/bottom_sheet_custom.dart';
import 'package:base_getx_2025/widgets/custom_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScreen(
        titleAppBar: '${'hello'.tr} JaykinD',
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RouterName.SettingScreen),
            icon: const Icon(Icons.settings),
          ),
        ],
        bottom: TabBar(
          controller: controller.tabCtr,
          onTap: (index) {
            if (index == 0) {
              Get.rootDelegate
                  .toNamed('${RouterName.HomeScreen}${RouterName.RedPage}');
            } else {
              Get.rootDelegate
                  .toNamed('${RouterName.HomeScreen}${RouterName.BluePage}');
            }
          },
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
        body: TabBarView(
          controller: controller.tabCtr,
          children: const [
            RedPage(),
            BluePage(),
          ],
        ),
        floatButton: FloatingActionButton(
          child: const Icon(Icons.add_a_photo),
          onPressed: () async {
            showBarModalBottomSheet(
              context: context,
              expand:  false,
              backgroundColor: Colors.transparent,
              builder: (context) =>  BottomSheetCustom(
                onGallery: ()=> controller.onPickImage(ImageSource.gallery),
                onTakePhoto: ()=> controller.onPickImage(ImageSource.camera),
              ),
            );
            // Get.bottomSheet();
            // final source = await showDialog<ImageSource>(
            //   context: context,
            //   builder: (context) => SimpleDialog(
            //     title: const Text("Chọn ảnh"),
            //     children: [
            //       SimpleDialogOption(
            //         onPressed: () => Navigator.pop(context, ImageSource.camera),
            //         child: const Text("Chụp ảnh"),
            //       ),
            //       SimpleDialogOption(
            //         onPressed: () =>
            //             Navigator.pop(context, ImageSource.gallery),
            //         child: const Text("Chọn từ thư viện"),
            //       ),
            //     ],
            //   ),
            // );
            // if (source != null) await _pickImage(source);
          },
        ),
      ),
    );
  }
}
