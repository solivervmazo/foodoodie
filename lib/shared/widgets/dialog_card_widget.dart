import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

class DialogCardWidget extends StatelessWidget {
  const DialogCardWidget({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.iconData,
    this.icon,
    this.expanded = true,
    this.toggle,
    required this.builder,
    this.titleBuilder,
    this.collapseIconName = "arrowCollapse",
    this.expandIconName = "arrowExpand",
    this.showTitleOnExpand = true,
    this.showTitleOnCollapse = true,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? iconData;
  final Widget? icon;
  final bool expanded;
  final VoidCallback? toggle;
  final Widget Function(Color? backgroundColor, Color? foregroundColor) builder;
  final Widget Function(Color? backgroundColor, Color? foregroundColor)?
      titleBuilder;
  final String? collapseIconName;
  final bool showTitleOnExpand;
  final bool showTitleOnCollapse;

  final String? expandIconName;

  static Color backgroundScheme({
    Color? light,
    Color? dark,
  }) =>
      Get.isDarkMode
          ? dark ?? AppTheme.ext(null).schemeLightColor!
          : light ?? AppTheme.ext(null).schemeSecondaryColor!;

  static Color foregroundScheme({
    Color? light,
    Color? dark,
  }) =>
      Get.isDarkMode
          ? dark ?? AppTheme.ext(null).schemeLightColor!
          : light ?? AppTheme.ext(null).schemeSecondaryColor!;

  Widget _title() {
    if (showTitleOnExpand && expanded) {
      return titleBuilder != null
          ? titleBuilder!(
              backgroundColor,
              foregroundColor,
            )
          : const SizedBox();
    }

    if (showTitleOnCollapse && !expanded) {
      return titleBuilder != null
          ? titleBuilder!(
              backgroundColor,
              foregroundColor,
            )
          : const SizedBox();
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCardWidget(
      padding: EdgeInsets.zero,
      body: Container(
        padding: ScaffoldCardWidget.cardWidgetPadding.copyWith(
          top: 5.0,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor != null
              ? backgroundColor!.withOpacity(0.4)
              : backgroundScheme().withOpacity(0.4),
        ),
        child: Column(
          children: [
            Row(
              children: [
                expanded
                    ? const SizedBox()
                    : AppIcons.icons(
                        data: iconData,
                        size: 20.0,
                        color: backgroundColor ?? backgroundScheme(),
                      )["placeholder"]!,
                const GapWidget.horizontal(5.0),
                Expanded(
                  child: _title(),
                ),
                const GapWidget.horizontal(3.0),
                AppButtons(
                  null,
                  onTap: toggle,
                  icon: AppIcons.icons(
                    size: 20.0,
                    color: foregroundScheme(
                      light: foregroundColor,
                    ),
                  )[expanded ? collapseIconName : expandIconName],
                ).iconButton,
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (child, animation) {
                return SizeTransition(sizeFactor: animation, child: child);
              },
              child: expanded
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        icon ??
                            AppIcons.icons(
                              data: iconData,
                              size: 65.0,
                              color: backgroundColor ?? backgroundScheme(),
                            )["placeholder"]!,
                        const GapWidget.horizontal(3.0),
                        Expanded(
                          child: builder(
                            backgroundColor,
                            foregroundColor,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}



                ///Card Title
                // Row(
                //   children: [
                //     const GapWidget.horizontal(8),
                //     AppIcons.hourglassEnd(
                //       size: 13.0,
                //       color:
                //           foreGroundColor ?? AppTheme.ext(null).schemeTertiaryColor,
                //     ).regular,
                //     const GapWidget.horizontal(5),
                //     AppText(
                //       "30 mins Cooking time",
                //       style: TextStyle(
                //         fontSize: 13.0,
                //         fontWeight: FontWeight.w500,
                //         color: foreGroundColor ??
                //             AppTheme.ext(null).schemeTertiaryColor,
                //       ),
                //     ).regular,
                //   ],
                // ),