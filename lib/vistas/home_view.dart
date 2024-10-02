import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topicos202402/widgets/credit_card.dart';
import 'package:topicos202402/widgets/top_header.dart';
import 'package:topicos202402/widgets/transacrtion_widget.dart';
import 'package:topicos202402/widgets/user_avatar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _bottomNavIndex = 0;

  final List<double> balances = [
    41000,
    3700,
    3000,
    4000,
    5000,
  ];

  final List<String> nombres = [
    'Juan',
    'Pedro',
    'Maria',
    'Jose',
    'Ana',
    'Luis',
    'Carlos',
    'Sofia',
    'Laura',
    'Fernando',
  ];

  final List<double> amounts = [
    -325,
    -100,
    400,
    -200,
    343,
    -905,
  ];

  final List<String> labels = [
    'Transfer to Siti',
    'Coffee',
    'Supermarket',
    'Nomina',
  ];

  final List<String> dates = [
    'Today, 08:23 PM',
    'Yesterday, 02:51 PM',
    'Yesterday, 10:23 AM',
    'Today, 11:23 AM',
    'Now, 08:23 AM',
  ];

  final List<int> typesTransaction = [
    1,
    2,
    3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const TopHeaderWidget(),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    child: CreditCard(
                      cardType: (index + 1) % 2,
                      balance: balances[index],
                      expDate: '12/25',
                      type: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  const Text(
                    'Transfer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  11,
                  (index) {
                    return index > 0
                        ? UserAvatar(
                            imageUrl: 'https://i.pravatar.cc/150?img=$index',
                            name: nombres[index % nombres.length],
                            onTap: () {
                              print('User');
                            },
                          )
                        : UserAvatar(
                            onTap: () {
                              print('No User');
                            },
                          );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(4, (index) {
                return TransactionWidget(
                  amount: amounts[index % amounts.length],
                  label: labels[index % labels.length],
                  date: dates[index % dates.length],
                  type: typesTransaction[index % typesTransaction.length],
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          final IconData icon;
          switch (index) {
            case 0:
              icon = Icons.home;
              break;
            case 1:
              icon = Icons.balance;
              break;
            case 2:
              icon = Icons.wallet;
              break;
            default:
              icon = Icons.person;
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                index == 0 ? 'Home' : 'Profile',
                style: TextStyle(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
            ],
          );
        },

        gapLocation: GapLocation.none,
        activeIndex: _bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
