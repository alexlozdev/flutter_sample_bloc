import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/screens/home/view/home.dart';

import '../../../const/constants.dart';
import '../../../model/basket.dart';
import '../../../widgets/common/app_bar/common_app_bar.dart';
import '../../../widgets/common/scaffold/common_screen.dart';
import '../../user/bloc/user_bloc.dart';
import '../bloc/start_bloc.dart';
import '../model/page_item.dart';
import 'bottom_bar.dart';

class StartScreen extends StatefulWidget {

  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();

    // screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }

  static const basketLabel = '1';

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<StartBloc, StartState>(
      builder: (startContext, startState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return CommonScreen(
              appBar: CommonAppBar(
                onLeadingPressed: () {
                },
                user: state.user,
                basket: Basket(
                    items: {basketLabel: 4}
                ),
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(vertical: Constants.screenPaddingV),
                child: getBody(pageItem: startState.pageItem),
              ),
              ad: null,
              bottom: BottomBar(
                selectedItem: startState.pageItem,
                items: PageItem.pages,
                onSelected: (value) {
                  //_startController.selPage.value = value;
                  startContext.read<StartBloc>().add(StartPageChanged(value));
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget getBody({required PageItem pageItem}) {
    if (pageItem.name == PageItem.home) {
      return const HomeScreen();
    } else {
      return Container();
    }
  }

}