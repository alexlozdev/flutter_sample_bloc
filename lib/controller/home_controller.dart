import 'package:flutter_ui_test/model/portfolio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  /// portfolios
  var portfolios = <Portfolio>[].obs;


  /// search key
  var searchKey = '';

  /// display search key
  var dispSearchKey = ''.obs;

  /// init
  init() {
    portfolios.value = [
      const Portfolio(image: 'assets/images/portfolio1.jpg', comment1: 'RUN WITH US!', comment2: 'LIFE IN THE FAST LANE'),
      const Portfolio(image: 'assets/images/portfolio2.jpg', comment1: 'REFRESH YOUR FITNESS', comment2: 'LOOK GREAT'),
      const Portfolio(image: 'assets/images/portfolio3.jpg', comment1: 'NO PAIN, NO GAIN', comment2: 'LOOK MORE FIT'),
      const Portfolio(image: 'assets/images/portfolio4.jpg', comment1: 'STAY HAPPY, STAY FIT', comment2: 'FITNESS FOR EVERYONE'),
    ];


  }


}