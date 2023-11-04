library fancy_menu;
import 'dart:async';

import 'package:flutter/material.dart';

class fancy_menu{
  final BuildContext context;
  final Offset position;
  final List<Map<String, dynamic>> menuItemsList;
  final Color backgroundColor;
  final Color shadowColor;
  final Color fontColor;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double topRightRadius;
  final double topLeftRadius;
  final double elavation;
  final double fontSize;
  fancy_menu({
    required this.context,
    required this.position,
    required this.menuItemsList,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.fontColor = Colors.black,
    this.bottomLeftRadius = 15.0,
    this.bottomRightRadius = 15.0,
    this.topRightRadius = 15.0,
    this.topLeftRadius = 15.0,
    this.elavation = 8.0,
    this.fontSize = 12.0,
  });
  Future<Future<int?>> showPopupMenu() async {

    final completer = Completer<int?>();

    List<PopupMenuItem<int>> buildPopupMenuItems() {
      return menuItemsList.map<PopupMenuItem<int>>((item) {
        return PopupMenuItem<int>(
          value: item['value'],
          onTap: (){
            completer.complete(item['value']);
          },
          child: Row(
            children: [
              item['iconPath'],
              const SizedBox(width: 15),
              Text(
                item['text'],
                style: TextStyle(fontSize: fontSize,color: fontColor),
              ),
            ],
          ),
        );
      }).toList();
    }

    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    await showMenu(
      color: backgroundColor,
      shadowColor: shadowColor,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeftRadius),
          bottomRight: Radius.circular(bottomRightRadius),
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
      ),
      context: context,
      position: RelativeRect.fromRect(Rect.fromPoints(position, position), Offset.zero & overlay.size,
      ),
      items: buildPopupMenuItems(),

      elevation: elavation,
    );
    return completer.future;

  }


}