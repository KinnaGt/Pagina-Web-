import 'package:flutter/cupertino.dart';
import 'package:webtest/model/section.dart';
import 'package:webtest/widgets/Components/product_list_view.dart';

import 'Container/section_container.dart';

class ProductSection extends StatelessWidget {
  Section section;
  ProductSection(this.section);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionContainer(
          title:section.title ,
          subTitle: section.subtitle,
          color: section.color,
        ),
       ProductListView(section.list)
      ],
    );
  }

}