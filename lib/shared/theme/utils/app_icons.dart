import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoodie/shared/theme.dart';

class AppIcons extends IconsSize {
  const AppIcons(super.icon, {super.key, super.color, super.size});

  static const IconData drawerIcon = FontAwesomeIcons.bars;

  static Map<String, IconData> get iconsData => <String, IconData>{
        "placeholder": Icons.question_mark,
        "recipe": Icons.book,
        "comment": Icons.messenger_sharp,
        "favorite": Icons.favorite,
        "hourglassEnd": FontAwesomeIcons.hourglassEnd,
        "navigatorBack": FontAwesomeIcons.arrowLeft,
        "send": Icons.send,
        "emoji": Icons.emoji_emotions,
        "commentReply": Icons.reply,
        "optionsThreeDots": Icons.more_horiz_rounded,
        "add": Icons.add_rounded,
        "home": Icons.home_rounded,
        "explore": Icons.explore_rounded,
        "notification": Icons.notifications,
        "profile": Icons.person,
        "openBook": Icons.menu_book_rounded,
        "menuList": Icons.list_alt,
        "arrowExpand": Icons.expand_more,
        "arrowCollapse": Icons.expand_less,
      };

  static Map<String, IconsSize> icons({
    IconData? data,
    double? size,
    Color? color,
  }) {
    return <String, IconsSize>{
      "placeholder": IconsSize(
        data ?? iconsData["placeholder"],
        size: size,
        color: color,
      ),
      "recipe": recipe(data: data, size: size, color: color),
      "comment": comment(data: data, size: size, color: color),
      "favorite": favorite(data: data, size: size, color: color),
      "hourglassEnd": hourglassEnd(data: data, size: size, color: color),
      "navigatorBack": navigatorBack(data: data, size: size, color: color),
      "send": send(data: data, size: size, color: color),
      "emoji": emoji(data: data, size: size, color: color),
      "commentReply": commentReply(data: data, size: size, color: color),
      "optionsThreeDots":
          optionsThreeDots(data: data, size: size, color: color),
      "add": add(data: data, size: size, color: color),
      "home": home(data: data, size: size, color: color),
      "explore": explore(data: data, size: size, color: color),
      "notification": notification(data: data, size: size, color: color),
      "profile": profile(data: data, size: size, color: color),
      "openBook": openBook(data: data, size: size, color: color),
      "menuList": menuList(data: data, size: size, color: color),
      "arrowExpand": arrowExpand(data: data, size: size, color: color),
      "arrowCollapse": arrowCollapse(data: data, size: size, color: color),
    };
  }

  static IconsSize recipe({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["recipe"],
      size: size,
      color: color,
    );
  }

  static IconsSize comment({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["comment"],
      size: size,
      color: color,
    );
  }

  static IconsSize favorite({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["favorite"],
      size: size,
      color: color,
    );
  }

  static IconsSize hourglassEnd({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["hourglassEnd"],
      size: size,
      color: color,
    );
  }

  static IconsSize navigatorBack({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["navigatorBack"],
      size: size,
      color: color,
    );
  }

  static IconsSize send({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["send"],
      size: size,
      color: color,
    );
  }

  static IconsSize emoji({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["emoji"],
      size: size,
      color: color,
    );
  }

  static IconsSize commentReply({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["commentReply"],
      size: size,
      color: color,
    );
  }

  static IconsSize optionsThreeDots(
      {IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["optionsThreeDots"],
      size: size,
      color: color,
    );
  }

  static IconsSize add({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["add"],
      size: size,
      color: color,
    );
  }

  static IconsSize home({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["home"],
      size: size,
      color: color,
    );
  }

  static IconsSize explore({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["explore"],
      size: size,
      color: color,
    );
  }

  static IconsSize notification({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["notification"],
      size: size,
      color: color,
    );
  }

  static IconsSize profile({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["profile"],
      size: size,
      color: color,
    );
  }

  static IconsSize openBook({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["openBook"],
      size: size,
      color: color,
    );
  }

  static IconsSize menuList({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["menuList"],
      size: size,
      color: color,
    );
  }

  static IconsSize arrowExpand({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["arrowExpand"],
      size: size,
      color: color,
    );
  }

  static IconsSize arrowCollapse({IconData? data, double? size, Color? color}) {
    return IconsSize(
      data ?? iconsData["arrowCollapse"],
      size: size,
      color: color,
    );
  }
}

class IconsSize extends Icon {
  const IconsSize(
    super.icon, {
    super.key,
    super.size,
    super.color,
  });

  IconsMode get large => IconsMode(
        icon,
        size: size ?? 20,
        color: color,
      );

  IconsMode get regular => IconsMode(
        icon,
        size: size ?? 18,
        color: color,
      );

  IconsMode get small => IconsMode(
        icon,
        size: size ?? 10,
        color: color,
      );
}

class IconsMode extends Icon {
  const IconsMode(
    super.icon, {
    super.key,
    required super.size,
    super.color,
  });

  Icon get light => Icon(
        super.icon,
        size: size,
        color: color ?? AppTheme.ext(null).onSurfaceColorDark,
      );

  Icon get dark => Icon(
        super.icon,
        size: size,
        color: color ?? AppTheme.ext(null).onSurfaceColor,
      );
}
