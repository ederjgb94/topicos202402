import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function onTap;
  const UserAvatar({
    super.key,
    this.imageUrl = '',
    this.name = 'add',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(
              0xffBE9BC7,
            ),
            backgroundImage: imageUrl == ''
                ? null
                : NetworkImage(
                    imageUrl,
                  ),
            child: name == 'add'
                ? const Icon(
                    Icons.add,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
