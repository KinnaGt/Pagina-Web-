import 'package:flutter/material.dart';
import 'package:webtest/util/keys.dart';
import 'package:webtest/values/responsive_app.dart';
import 'package:webtest/values/string_app.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double opacity;
  ShopAppBar(this.opacity);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return AppBar(
      backgroundColor:
      Theme.of(context).primaryColor.withOpacity(opacity),
      elevation: 0,
      leading:IconButton(
        icon: Icon(Icons.menu),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          homeScaffoldKey.currentState?.openDrawer();
        },
      ) ,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.local_grocery_store_outlined),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
          },
        ),
      ],
      title: Text(
        shopStr,
        style: TextStyle(
          color: Colors.blueGrey[100],
          fontSize: responsiveApp.headline6,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          letterSpacing: responsiveApp.letterSpacingHeaderWidth,
        ),
      ),
    );
  }
}