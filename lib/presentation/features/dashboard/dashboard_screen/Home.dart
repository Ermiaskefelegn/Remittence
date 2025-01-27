import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/model/BankingModel.dart';
import 'package:remittance/core/utils/BankingColors.dart';
import 'package:remittance/core/utils/BankingContants.dart';
import 'package:remittance/core/utils/BankingDataGenerator.dart';
import 'package:remittance/core/utils/BankingImages.dart';
import 'package:remittance/core/utils/BankingWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/presentation/features/authentication/auth_provider.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/transaction_provider.dart';

class BankingHome1 extends ConsumerStatefulWidget {
  static String tag = '/BankingHome1';

  @override
  BankingHome1State createState() => BankingHome1State();
}

class BankingHome1State extends ConsumerState<BankingHome1> {
  int currentIndexPage = 0;
  int? pageLength;

  late List<BankingHomeModel> mList1; // Replace with your transaction model
  late List<BankingHomeModel2> mList2; // Replace with your other list model

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Banking_palColor);
    currentIndexPage = 0;
    pageLength = 3;

    // Populate mock data
    mList1 = bankingHomeList1(); // Replace with actual transaction list
    mList2 = bankingHomeList2(); // Replace with other list data
  }

  @override
  Widget build(BuildContext context) {
    // Access the logged-in account data using Riverpod
    final loggedInAccount = ref.watch(authStateProvider);
    final transactions = ref.watch(transactionListProvider);

    return Scaffold(
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 280,
                floating: false,
                pinned: true,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                backgroundColor:
                    innerBoxIsScrolled ? Banking_palColor : Banking_Primary,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                title: Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                  margin: EdgeInsets.only(bottom: 20, top: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage(Banking_ic_user1),
                          radius: 24),
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, ${loggedInAccount?.firstName ?? 'User'}",
                            style:
                                primaryTextStyle(color: Banking_whitePureColor),
                          ),
                          Text(
                            "How are you today?",
                            style:
                                primaryTextStyle(color: Banking_whitePureColor),
                          ),
                        ],
                      ).expand(),
                      Icon(Icons.notifications,
                          size: 30, color: Banking_whitePureColor)
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topLeft,
                            colors: <Color>[Banking_Primary, Banking_palColor],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 140, 16, 0),
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 20),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Banking_palColor),
                          boxShadow: defaultBoxShadow(),
                          backgroundColor: context.cardColor,
                        ),
                        child: Container(
                          height: 160,
                          child: TopCard(
                            name:
                                "${loggedInAccount?.firstName ?? 'Name'} ${loggedInAccount?.lastName ?? ''}",
                            acno:
                                "${loggedInAccount?.accountNumber ?? '0000000000'}",
                            bal:
                                "\$${loggedInAccount?.balance.toStringAsFixed(2) ?? '0.00'}",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent Transactions", style: primaryTextStyle()),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    itemCount: transactions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: 8, bottom: 0),
                        decoration: boxDecorationRoundedWithShadow(
                          8,
                          backgroundColor: context.cardColor,
                          spreadRadius: 0,
                          blurRadius: 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.account_balance_wallet,
                                    size: 24,
                                    color: index % 2 == 0
                                        ? Banking_Primary
                                        : Banking_BalanceColor),
                                10.width,
                                Text(
                                  '${transactions[index].recipient}',
                                  style: primaryTextStyle(
                                      size: 16,
                                      color: index % 2 == 0
                                          ? Banking_Primary
                                          : Banking_BalanceColor,
                                      fontFamily: fontMedium),
                                ).expand(),
                                Text(transactions[index].amount.toString(),
                                    style: primaryTextStyle(
                                        color: index % 2 == 0
                                            ? Banking_Primary
                                            : Banking_BalanceColor,
                                        size: 16)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(transactions[index].date.toString(),
                                      style: secondaryTextStyle()),
                                  Text(transactions[index].transactionId,
                                      style: secondaryTextStyle()),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
