import 'package:flutter/cupertino.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:webtest/model/section.dart';
import 'package:webtest/values/responsive_app.dart';
import 'package:webtest/widgets/WebComponents/Body/menu_section.dart';
import 'package:webtest/widgets/WebComponents/Body/product_section.dart';

class SectionListView extends StatelessWidget {
  AutoScrollController autoScrollController;

  SectionListView(this.autoScrollController);
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          sections.length+1, (index) {
          return (index == 0)
              ? Padding(
              padding: responsiveApp.edgeInsetsApp.allExLargeEdgeInsets,
              child: addScroll(MenuSection(autoScrollController), 0))
              :Padding(
              padding: responsiveApp.edgeInsetsApp.allExLargeEdgeInsets,
              child: addScroll(ProductSection(sections[index - 1]), index));
        } ,
        ));
  }

  addScroll(Widget child, index) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: autoScrollController,
      index: index,
      child: child,
    );
  }
}