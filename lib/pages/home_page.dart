import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:webtest/util/keys.dart';
import 'package:webtest/util/sizing_info.dart';
import 'package:webtest/values/responsive_app.dart';
import 'package:webtest/widgets/MobileComponents/menu_tap.dart';
import 'package:webtest/widgets/MobileComponents/shop_appbar.dart';
import 'package:webtest/widgets/MobileComponents/shop_drawer.dart';
import 'package:webtest/widgets/WebComponents/Body/menu_section.dart';
import 'package:webtest/widgets/WebComponents/Body/section_list.dart';
import 'package:webtest/widgets/WebComponents/Footer/footer.dart';
import 'package:webtest/widgets/WebComponents/Header/header.dart';
import 'package:webtest/widgets/Components/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  double _opacity = 0;

  late AutoScrollController autoScrollController;
  bool _isVisible = false;
  late ResponsiveApp responsiveApp;

  _scrollListener() {
    setState(() {
      _scrollPosition = autoScrollController.position.pixels;
    });
  }

  @override
  void initState() {

    autoScrollController = AutoScrollController(
      //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    autoScrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    _opacity = _scrollPosition < responsiveApp.opacityHeight
        ? _scrollPosition / responsiveApp.opacityHeight
        : 1;

    _isVisible = _scrollPosition >= responsiveApp.menuHeight;
    return Scaffold(
        key: homeScaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            onPressed: () => {
              autoScrollController.scrollToIndex(0)},
            child:  const Icon(Icons.arrow_upward),
          ),
        ),
        appBar: 
      isMobileAndTablet(context)
            ? ShopAppBar(_opacity)
            : Header(_opacity),
        drawer: ShopDrawer(),
        body: ListView(controller: autoScrollController, children: [
          Carousel(),
          //MenuSection(AutoScrollController()),
          isMobileAndTablet(context)
              ? MenuTap()
              : SectionListView(autoScrollController),
          isMobileAndTablet(context) ? const SizedBox.shrink() : Footer()
          
        ]));
  }
}