import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webtest/values/responsive_app.dart';
import 'package:webtest/values/string_app.dart';

import 'bottom_column.dart';
import 'info_text.dart';

class Footer extends StatelessWidget {
  late ResponsiveApp responsiveApp;

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Container(
      padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomColumn(
                heading: aboutStr,
                s1: contactUsStr,
                s2: aboutUsStr,
                s3: knowUsStr,
              ),
              BottomColumn(
                heading: helpStr,
                s1: paymentStr,
                s2: cancellationStr,
                s3: fAQStr,
              ),
              BottomColumn(
                heading: socialStr,
                s1: twitterStr,
                s2: facebookStr,
                s3: instagramStr,
              ),
              Container(
                color: Theme.of(context).accentColor,
                width: responsiveApp.dividerVtlWidth,
                height: responsiveApp.dividerVtlHeight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding:responsiveApp.edgeInsetsApp.vrtSmallEdgeInsets ,
                      child:InfoText(
                        type: emailStr,
                        text: emailDefaultStr,
                      )),
                  InfoText(
                    type: addressStr,
                    text: addressDefaultStr,
                  )
                ],
              ),
            ],
          ),
          Padding(
              padding: responsiveApp.edgeInsetsApp.vrtSmallEdgeInsets,
              child: Divider(
                color: Theme.of(context).accentColor,
                height: responsiveApp.dividerHznHeight,
              )),
          Text(
            copyrightStr,
            style: Theme.of(context).accentTextTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}