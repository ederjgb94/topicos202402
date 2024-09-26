import 'package:flutter/material.dart';

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Good Night',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      subtitle: const Text(
        'Nicolas Smith',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: Color.fromARGB(255, 208, 209, 214),
                width: 1,
              ),
            ),
          ),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.notification_add,
        ),
      ),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://i.pravatar.cc/150?img=8',
        ),
        radius: 30,
      ),
    );
  }
}
