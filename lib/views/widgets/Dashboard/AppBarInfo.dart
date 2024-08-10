import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wosul_app/controllers/userController.dart';

class AppBarInfo extends ConsumerWidget {
  const AppBarInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    // final user = ref.watch(userControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        customButton: Icon(Icons.account_circle_outlined,
                            size: size.height / 30),
                        items: [
                          ...MenuItems.firstItems.map(
                            (item) => DropdownMenuItem<MenuItem>(
                              value: item,
                              child: MenuItems.buildItem(item),
                            ),
                          ),
                          const DropdownMenuItem<Divider>(
                              enabled: false, child: Divider()),
                          ...MenuItems.secondItems.map(
                            (item) => DropdownMenuItem<MenuItem>(
                              value: item,
                              child: MenuItems.buildItem(item),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          MenuItems.onChanged(context, value! as MenuItem, ref);
                        },
                        dropdownStyleData: DropdownStyleData(
                          width: 160,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color.fromRGBO(30, 64, 175, 1),
                          ),
                          offset: const Offset(0, 8),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          customHeights: [
                            ...List<double>.filled(
                                MenuItems.firstItems.length, 48),
                            8,
                            ...List<double>.filled(
                                MenuItems.secondItems.length, 48),
                          ],
                          padding: const EdgeInsets.only(left: 16, right: 16),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none_outlined,
                          size: size.height / 30)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search_outlined, size: size.height / 30),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Image(
                  width: size.height / 10,
                  image: const AssetImage("assets/images/kashaf.png"),
                ),
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 32, top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  // width: size.height / 5,
                  child: AutoSizeText(
                    "اهلا بك في كشاف !",
                    // maxLines: 1,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  // width: size.height / 4,
                  child: AutoSizeText(
                    " مرحبا بك، عبدالعزيز - ارامكو",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [home, share, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'Home', icon: Icons.home);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item, WidgetRef ref) {
    switch (item) {
      case MenuItems.home:
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.logout:
        ref.watch(userControllerProvider.notifier).logout();
        break;
    }
  }
}
