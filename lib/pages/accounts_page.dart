import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bank_account_model.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Счета"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 1, 0, 15),
                    child:
                        CupertinoSearchTextField(placeholder: "Поиск счетов")),
                const Divider(height: 2),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 7),
                    child: Text("ДEБЕТОВЫЕ КАРТЫ")),
                AccountCardWidget(
                  bankAccount: BankAccount(
                      title: "ВТБ RUB",
                      amount: "300₽",
                      cardNumber: "VISA **** 1234",
                      assetPath: 'assets/bank_logos/vtb.png'),
                ),
                AccountCardWidget(
                  bankAccount: BankAccount(
                      title: "ВТБ JNY",
                      amount: "300¥",
                      cardNumber: "VISA **** 1234",
                      assetPath: 'assets/bank_logos/vtb.png'),
                ),
                AccountCardWidget(
                  bankAccount: BankAccount(
                      title: "Тинькофф RUB",
                      amount: "300\$",
                      cardNumber: "VISA **** 1234",
                      assetPath: 'assets/bank_logos/tink.png'),
                ),
                AccountCardWidget(
                  bankAccount: BankAccount(
                      title: "Сбербанк RUB",
                      amount: "300₽",
                      cardNumber: "VISA **** 1234",
                      assetPath: 'assets/bank_logos/sber.png'),
                )
              ],
            ),
          ),
        ));
  }
}

class AccountCardWidget extends StatelessWidget {
  final BankAccount bankAccount;
  const AccountCardWidget({super.key, required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0),
        CupertinoListTile(
          leading: Image(
            // image: AssetImage('assets/bank_logos/vtb.png'),
            image: AssetImage(bankAccount.assetPath),
          ),
          title: Text(bankAccount.title),
          subtitle: Text(bankAccount.cardNumber),
          additionalInfo: Text(bankAccount.amount),
          trailing: Icon(
            CupertinoIcons.chevron_forward,
            color: Colors.black38,
          ),
          onTap: () {
            //ios анимация
            // Navigator.of(context).push(CupertinoPageRoute(
            //     builder: ((context) =>
            //         ChatPage(pageTitle: user.displayName!))));
          },
        ),
      ],
    );
  }
}
