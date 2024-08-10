import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wosul_app/views/widgets/Dashboard/CustomAppBar.dart';
import 'package:wosul_app/views/widgets/Dashboard/tabScreens/Branches.dart';
import 'package:wosul_app/views/widgets/Dashboard/tabScreens/General.dart';
import 'package:wosul_app/views/widgets/Dashboard/tabScreens/InventoryTab.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  var currentTab = 2;

  void changePage(int value) {
    setState(() {
      currentTab = value;
    });
  }

  final tabs = const [
    InventoryTab(),
    BranchesTab(),
    GeneralSubScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(244, 246, 251, 1),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height / 4.5),
          child: CustomAppBar(
            changePage: changePage,
          ),
        ),
        body: tabs[currentTab],
      ),
    );
  }
}
