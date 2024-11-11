
import 'package:authentech/features/core/screens/home.dart';
import 'package:authentech/utils/constants/colors.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Iconsax.home, color: controller.selectedIndex.value == 0 ? TColors.primary : Colors.grey),
                  onPressed: () => controller.selectedIndex.value = 0,
                ),
                IconButton(
                  icon: Icon(Iconsax.graph, color: controller.selectedIndex.value == 1 ? TColors.primary : Colors.grey),
                  onPressed: () => controller.selectedIndex.value = 1,
                ),
                const SizedBox(width: 40), // The dummy child for the notch
                IconButton(
                  icon: Icon(Iconsax.wallet, color: controller.selectedIndex.value == 2 ? TColors.primary : Colors.grey),
                  onPressed: () => controller.selectedIndex.value = 2,
                ),
                IconButton(
                  icon: Icon(Iconsax.user, color: controller.selectedIndex.value == 3 ? TColors.primary : Colors.grey),
                  onPressed: () => controller.selectedIndex.value = 3,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() =>  HomePage()),
        child: Icon(Iconsax.add),
        backgroundColor: darkMode ? TColors.black : TColors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
}
