import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:webtest/model/menu.dart';
import 'package:webtest/values/responsive_app.dart';
import 'package:webtest/values/string_app.dart';

import 'Container/menu_container.dart';
import 'Container/section_container.dart';

class MenuSection extends StatelessWidget {

  AutoScrollController _scrollController;
  MenuSection(this._scrollController);
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    return Column(
      children: [
        SectionContainer(
          title: sectionMenuTitleStr,
          subTitle: sectionMenuSubTitleStr,
          color: Colors.redAccent 
        ),
        Padding(padding: responsiveApp.edgeInsetsApp.onlyExLargeTopEdgeInsets,child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              menu.length, (index) => MenuContainer(index: index,onPress:()=> scrollIndex(index+1))),
        ))
      ],
    );
  }

  scrollIndex(index){
    _scrollController.scrollToIndex(index);
  }
}