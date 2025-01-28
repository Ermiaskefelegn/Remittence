import 'package:flutter/material.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/core/utils/Images.dart';
import 'package:remittance/core/utils/Strings.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/Currency_calculator.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/home.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/transfer.dart';
import 'package:remittance/core/utils/BottomNavigationBar.dart';
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
    CurrencyConverterScreen(),
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
        selectedItemColor: Primary,
        unselectedItemColor: greyColor.withValues(alpha: 0.5),
        items: <BankingBottomNavigationBarItem>[
          BankingBottomNavigationBarItem(icon: ic_Home, title: Text(lbl_Home)),
          BankingBottomNavigationBarItem(
              icon: ic_Transfer, title: Text(lbl_Transfer)),
          BankingBottomNavigationBarItem(
              icon: ic_Saving, title: Text(lbl_calculate)),
        ],
        currentIndex: selectedIndex,
        unselectedIconTheme:
            IconThemeData(color: greyColor.withValues(alpha: 0.5), size: 28),
        selectedIconTheme: IconThemeData(color: Primary, size: 28),
        onTap: _onItemTapped,
        type: BankingBottomNavigationBarType.fixed,
      ),
      body: pages[selectedIndex],
    );
  }
}
