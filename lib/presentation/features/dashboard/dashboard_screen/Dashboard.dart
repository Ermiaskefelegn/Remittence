import 'package:flutter/material.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Home.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Menu.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Transfer.dart';
import 'package:remittance/core/utils/BankingBottomNavigationBar.dart';
import 'package:remittance/core/utils/BankingColors.dart';
import 'package:remittance/core/utils/BankingImages.dart';
import 'package:remittance/core/utils/BankingStrings.dart';
import 'package:nb_utils/nb_utils.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var selectedIndex = 0;
  var pages = [
    BankingHome1(),
    TransferPage(),
    BankingMenu(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  void dispose() {
    setStatusBarColor(white);
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BankingBottomNavigationBar(
        selectedItemColor: Banking_Primary,
        unselectedItemColor: Banking_greyColor.withValues(alpha: 0.5),
        items: <BankingBottomNavigationBarItem>[
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Home, title: Text(Banking_lbl_Home)),
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Transfer, title: Text(Banking_lbl_Transfer)),
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Menu, title: Text(Banking_lbl_Profile)),
        ],
        currentIndex: selectedIndex,
        unselectedIconTheme: IconThemeData(
            color: Banking_greyColor.withValues(alpha: 0.5), size: 28),
        selectedIconTheme: IconThemeData(color: Banking_Primary, size: 28),
        onTap: _onItemTapped,
        type: BankingBottomNavigationBarType.fixed,
      ),
      body: pages[selectedIndex],
    );
  }
}
