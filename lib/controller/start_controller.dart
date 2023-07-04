import 'package:get/get.dart';

import '../model/advert.dart';

class StartController extends GetxController {


  /// advert
  var adverts = <Advert>[].obs;

  /// init controller
  init() {
    showAdvert();
  }

  /// show advert
  showAdvert() {
    adverts.value = [
      const Advert(
        msg1: 'Get 10% For 1ST ORDER',
        msg2: 'On All Stores'
      ),
    ];
  }

  removeAdvert() {
    adverts.value = [];
  }
}