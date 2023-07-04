

import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../bloc/start_bloc.dart';
import '../../../widgets/common/inkwell/common_inkwell.dart';
import '../../../widgets/common/text/common_label.dart';
import '../model/page_item.dart';

class BottomBar extends StatelessWidget {

  /// selected item id
  final PageItem selectedItem;

  /// page items
  final List<PageItem> items;

  /// callback when selecting item
  final Function(PageItem pageItem)? onSelected;

  /// bottom bar widget
  const BottomBar({
    Key? key,
    required this.selectedItem,
    required this.items,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
        color: Constants.whiteMiddle,
      ),
      child: Row(
        children: items.map((entry) {
          bool isSelected = isSelectedItem(entry);

          return Expanded(
            child: CommonInkWell(
              child: Stack(
                children: [
                  if (isSelected) ...[
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 8,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 4,
                            color: Constants.fgPrimary,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 15,),
                            Icon(entry.icon,
                              color: isSelectedItem(entry) ? Constants.fgPrimary : Constants.greyLight,
                            ),
                            CommonLabel(entry.name,
                              color: isSelectedItem(entry) ? Constants.fgPrimary : Constants.greyLight,
                              fontSize: Constants.fntNormalSize,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                if (onSelected != null) {
                  onSelected!(entry);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  /// check if item is selected or not
  bool isSelectedItem(PageItem pageItem) {
    if (selectedItem == pageItem) {
      return true;
    }

    return false;
  }

}