import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/category.dart';
import '../model/good.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial(goods: _selectCategory(Category.ride))) {

    /// change selected page
    on<HomeCategoryChanged>((event, emit) {
      final categoryLabel = event.category.label;
      // get goods according to the category.
      List<Good> goods = _selectCategory(categoryLabel);

      emit(state.copyWith(
        category: state.category.copyWith(label: event.category.label),
        goods: goods,
      ));

    });
  }

  /// select good category
  static List<Good> _selectCategory(String category) {

    if (category == Category.ride) {
      return [
        const Good(id: '', name: 'Economy', price: '', image: 'assets/images/car1.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Taxicab', price: '', image: 'assets/images/car2.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      ];
    } else if (category == Category.eat) {
      return [
        const Good(id: '', name: 'Sandwich1', price: '', image: 'assets/images/eat1.png', description: 'Select the sandwich size and price that fits your comfort level', ),
        const Good(id: '', name: 'Sandwich2', price: '', image: 'assets/images/eat2.png', description: 'Select the sandwich size and price that fits your comfort level', ),
        const Good(id: '', name: 'Sandwich3', price: '', image: 'assets/images/eat3.png', description: 'Select the sandwich size and price that fits your comfort level', ),
      ];
    } else {
      return [];
    }
  }
}