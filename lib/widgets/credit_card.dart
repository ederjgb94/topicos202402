import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final int cardType;
  final double balance;
  final String expDate;
  final int type;

  const CreditCard({
    super.key,
    required this.cardType,
    required this.balance,
    required this.expDate,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color:
            cardType == 1 ? const Color(0xffE7DAEC) : const Color(0xffFBAE84),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardType == 1
                ? const Text(
                    'Debit Card',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                : const Text(
                    'Credit Card',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Total Balance',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '\$${balance.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                type == 1
                    ? const Text(
                        'Visa',
                      )
                    : (type == 2
                        ? const Text(
                            'MasterCard',
                          )
                        : const Text(
                            'American Express',
                          )),
                Expanded(
                  child: Container(),
                ),
                Text(
                  expDate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
