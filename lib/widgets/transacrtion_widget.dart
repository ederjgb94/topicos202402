import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final int type;
  final String label;
  final String date;
  final double amount;
  const TransactionWidget({
    super.key,
    required this.type,
    required this.label,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        date,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        '${amount >= 0 ? '+' : '-'}\$${amount.abs().toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 16,
          color: amount >= 0
              ? const Color.fromARGB(255, 96, 169, 88)
              : const Color(0xffEF6963),
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor:
            type == 1 ? const Color(0xffBE9BC7) : const Color(0xffF9AD83),
        child: Icon(
          type == 2 ? Icons.coffee : Icons.wallet,
          color: Colors.white,
        ),
      ),
    );
  }
}
