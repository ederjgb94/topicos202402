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
        '\$${amount.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 16,
          color: type == 1 ? Colors.green : Colors.red,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: type == 1 ? Colors.green : Colors.red,
        child: Icon(
          type == 1 ? Icons.arrow_downward : Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
    );
  }
}
