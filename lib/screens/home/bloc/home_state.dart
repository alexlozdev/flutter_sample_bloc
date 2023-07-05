part of 'home_bloc.dart';

/// start state
final class HomeState extends Equatable {
  final Category category;

  final List<Good> goods;

  const HomeState({
    required this.category,
    required this.goods,
  });

  HomeState.initial({List<Good>? goods})
      : this(category: Category.all[0], goods: goods ?? []);

  HomeState copyWith({
    Category? category,
    List<Good>? goods,
  }) {
    return HomeState(
        category: category ?? this.category,
        goods: goods ?? this.goods,
    );
  }

  @override
  List<Object?> get props => [category];

}