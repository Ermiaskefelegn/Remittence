import 'package:remittance/core/utils/Widget.dart';
import 'package:remittance/domain/entities/transaction_entity.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import '../providers/transaction_provider.dart';

class TransferPage extends ConsumerStatefulWidget {
  static var tag = "/TransferPage";

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends ConsumerState<TransferPage> {
  final TextEditingController recipientNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  @override
  void dispose() {
    recipientNameController.dispose();
    accountNumberController.dispose();
    amountController.dispose();
    remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer Money"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Transfer Money",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Recipient Name Input
              EditText(
                text: "Recipient Name",
                keyboardType: TextInputType.text,
                isPassword: false,
                mController: recipientNameController,
              ),
              SizedBox(height: 8),
              // Account Number Input
              EditText(
                text: "Account Number",
                keyboardType: TextInputType.number,
                isPassword: false,
                mController: accountNumberController,
              ),
              SizedBox(height: 8),
              // Amount Input
              EditText(
                text: "Amount (USD)",
                keyboardType: TextInputType.number,
                isPassword: false,
                mController: amountController,
              ),
              SizedBox(height: 8),
              // Remark Input
              EditText(
                text: "Remark",
                keyboardType: TextInputType.text,
                isPassword: false,
                mController: remarkController,
              ),
              SizedBox(height: 16),
              // Transfer Button
              BankingButton(
                textContent: "Transfer",
                onPressed: () {
                  // Validate Input
                  final recipientName = recipientNameController.text.trim();
                  final accountNumber = accountNumberController.text.trim();
                  final amount = double.tryParse(amountController.text.trim());
                  final remark = remarkController.text.trim();

                  if (recipientName.isEmpty ||
                      accountNumber.isEmpty ||
                      amount == null ||
                      amount <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter valid details")),
                    );
                    return;
                  }

                  // Add the transaction to the list
                  final transactionNotifier =
                      ref.read(transactionListProvider.notifier);
                  transactionNotifier.addTransaction(TransactionEntity(
                    remark: remark,
                    accountNumber: accountNumber,
                    transactionId: Random().nextInt(1000000).toString(),
                    recipient: recipientName,
                    amount: amount,
                    date: DateTime.now(),
                  ));

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Transfer Successful!")),
                  );

                  // Clear the input fields
                  recipientNameController.clear();
                  accountNumberController.clear();
                  amountController.clear();
                  remarkController.clear();
                },
              ),
              SizedBox(height: 16),
              // Back to Dashboard
            ],
          ),
        ),
      ),
    );
  }
}
