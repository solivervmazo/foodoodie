library bootstrap.appbar;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoodie/dev/test_scaffold_widget.dart';
import 'package:foodoodie/explore/explore.dart';
import 'package:foodoodie/news_feed/news_feed.dart';
import 'package:foodoodie/profile/profile.dart';
import 'package:foodoodie/shared/controllers/bootstrap_controller.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

part 'widgets/search_widget.dart';

class Bootstrap extends GetView<BootstrapController> {
  const Bootstrap({
    super.key,
    required this.body,
    this.appBar,
    this.drawerBody,
    this.hasAppBar = true,
    this.hasDrawer = true,
    this.hasBottomBar = true,
    this.bottomBar,
    this.bootstrapFloatingActionButton,
  });

  final Widget body;
  final AppBarWidget? appBar;
  final Widget? bottomBar;
  final Widget? drawerBody;
  final Widget? bootstrapFloatingActionButton;
  final bool hasAppBar;
  final bool hasDrawer;
  final bool hasBottomBar;

  AppBarWidget _appBar(AppBarWidget? appBar) {
    Widget leading = AppButtons(
      null,
      onTap: () {},
      icon: const Icon(
        AppIcons.drawerIcon,
        size: 20.0,
      ),
    ).iconButton;

    Widget title = Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const GapWidget.horizontal(10.0),
          Flexible(
            // flex: 4,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
                // minWidth: 200,
              ),
              child: _SearchWidget(
                onTap: () {},
              ),
            ),
          ),
          const GapWidget.horizontal(10.0),
        ],
      ),
    );

    Widget action = Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Profile.go.profile(),
        child: CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          child: const Text('AH'),
        ),
      ),
    );

    return appBar ??
        AppBarWidget(
          leading: hasDrawer ? leading : null,
          title: title,
          action: action,
        );
  }

  Widget get bootstrapBottomBar => Obx(
        () => BottomAppBar(
          notchMargin: 5.0,
          color: AppTheme.ext(null).schemeSecondaryColor,
          shape: !controller.scrollIsForward.value
              ? const CircularNotchedRectangle()
              : null,
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: !controller.scrollIsForward.value ? 75 : 0,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceEvenly,
                runAlignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      ButtonWidget.circular(
                        onTap: () => NewsFeed.go.newsFeed(),
                        color: AppTheme.ext(null).appBarColor,
                        child: AppIcons.home(size: 20.0).large.dark,
                      ),
                      const AppText(
                        "Home",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ).regular.dark,
                    ],
                  ),
                  Column(
                    children: [
                      ButtonWidget.circular(
                        onTap: () => Explore.go.explore(),
                        color: AppTheme.ext(null).appBarColor,
                        child: AppIcons.explore(size: 20.0).large.dark,
                      ),
                      const AppText(
                        "Explore",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ).regular.dark,
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      ButtonWidget.circular(
                        onTap: () {},
                        color: AppTheme.ext(null).appBarColor,
                        child: AppIcons.notification(size: 20.0).large.dark,
                      ),
                      const AppText(
                        "Alerts",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ).regular.dark,
                    ],
                  ),
                  Column(
                    children: [
                      ButtonWidget.circular(
                        onTap: () => Profile.go.profile(),
                        color: AppTheme.ext(null).appBarColor,
                        child: AppIcons.profile(size: 20.0).large.dark,
                      ),
                      const AppText(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ).regular.dark,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget get bootstrappFoatingActionButton => Obx(
        () => Visibility(
          visible: !controller.scrollIsForward.value,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.black87,
            foregroundColor: AppTheme.ext(null).schemeSecondaryColor,
            child: AppIcons.add(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        appBar: hasAppBar ? _appBar(appBar) : null,
        body: body,
        backgroundColor: AppTheme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: hasBottomBar ? bootstrapBottomBar : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            hasBottomBar ? bootstrappFoatingActionButton : null,
      ),
    );
  }
}
