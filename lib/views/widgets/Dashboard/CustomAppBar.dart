import 'package:flutter/material.dart';
import 'package:wosul_app/views/widgets/Dashboard/AppBarInfo.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.changePage});

  final void Function(int number) changePage;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -20,
          child: Container(
            width: size.width,
            height: size.height / 4.5,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(187, 219, 233, 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const AppBarInfo(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 17),
            height: size.height / 20, // 45
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TabBar(
              onTap: (value) {
                widget.changePage(value);
              },
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(30, 64, 175, 1)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(child: Text("المواد الخام")),
                Tab(child: Text("الآلات")),
                Tab(child: Text("نظرة عامة")),
              ],
              controller: _tabController,
            ),
          ),
        ),
        // Placeholder()
      ],
    );
  }
}
