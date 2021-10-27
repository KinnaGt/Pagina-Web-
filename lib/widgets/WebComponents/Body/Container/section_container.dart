import 'package:flutter/material.dart';
import 'package:webtest/values/responsive_app.dart';


// ignore: must_be_immutable
class SectionContainer extends StatelessWidget {

  SectionContainer({
    Key? key,
    required this.title,
    required this.subTitle, required this.color,
  }) : super(key: key);

  final String title, subTitle;
  final Color color;
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return Container(
      width: responsiveApp.width,
      child: Row(
        children: [
          Container(
            margin: responsiveApp.edgeInsetsApp.onlyMediumRightEdgeInsets,
            padding: responsiveApp.edgeInsetsApp.onlyLargeBottomEdgeInsets,
            width: responsiveApp.sectionWidth,
            height: responsiveApp.sectionHeight,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).accentTextTheme.bodyText1,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}