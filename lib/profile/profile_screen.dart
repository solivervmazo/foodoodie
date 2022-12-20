import 'package:flutter/material.dart';
import 'package:foodoodie/profile/controllers/profile_controller.dart';
import 'package:foodoodie/shared/layouts/bootstrap.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

import '../shared/theme.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  AppBarWidget _appBar() {
    Widget leading = const BackWidget();

    Widget title = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppText("Profile").xLarge,
        ],
      ),
    );

    Widget action = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.brown.shade800,
        child: const Text('AH'),
      ),
    );

    return AppBarWidget(
      leading: leading,
      title: title,
      action: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Bootstrap(
      appBar: _appBar(),
      body: Column(
        children: [
          //posts/drafts
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 20,
            ),
          ),
        ],
      ),
      bottomBar: AnimatedContainer(
        duration: const Duration(
          milliseconds: 20,
        ),
        child: Wrap(
          children: <Widget>[
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue,
              fixedColor: Colors.white,
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: "Home",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
