import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/constants.dart';
import '../../../widgets/common/text/common_auto_label.dart';
import '../../../widgets/common/text_field/common_text_field_search.dart';
import '../bloc/home_bloc.dart';
import '../model/category.dart';
import 'widgets/category_button.dart';
import 'widgets/good_box.dart';
import 'widgets/portfolio_slider.dart';

class HomeScreen extends StatelessWidget {

  /// search key
  final String searchKey;

  /// callback when changed search key
  final Function(String searchKey, bool needUpdate)? onChangedSearchKey;

  /// callback when press search
  final Function()? onSearch;

  const HomeScreen({
    super.key,
    required this.searchKey,
    this.onChangedSearchKey,
    this.onSearch,
  });


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            // slider
            PortfolioSlider(items: state.portfolios,),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: Constants.screenPaddingH),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Constants.widgetSpaceV * 2,),
                    // what would you like
                    const CommonAutoLabel(
                      'What would you like to order today?',
                      color: Constants.fgPrimary,
                      fontSize: Constants.fntBigSize,
                    ),
                    const SizedBox(height: Constants.widgetSpaceV,),
                    // category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: Category.all.map((entry) {
                        return CategoryButton(
                          text: entry.label,
                          selected: state.category.label ==entry.label,
                          onPressed: () {
                            context.read<HomeBloc>().add(HomeCategoryChanged(entry));
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: Constants.widgetSpaceV,),
                    // search
                    CommonTextFieldSearch(
                      selValue: searchKey,
                      onChanged: onChangedSearchKey,
                      onSearch: onSearch,
                    ),
                    const SizedBox(height: Constants.widgetSpaceV,),
                    // good list
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: state.goods.map((entry) {
                            return GoodBox(
                              good: entry,
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

  }

}