import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onTap;
  const UserAvatar({
    super.key,
    this.imageUrl = '',
    this.name = 'add',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
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
              style: name == 'add'
                  ? const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      fontSize: 16,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
