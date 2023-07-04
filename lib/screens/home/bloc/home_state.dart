part of 'home_bloc.dart';

/// start state
final class HomeState extends Equatable {
  final Category category;

  const HomeState({required this.category});

  HomeState.initial()
      : this(category: Category.all[0]);

  HomeState copyWith({Category? category}) {
    return HomeState(
        category: category ?? this.category
    );
  }

  @override
  List<Object?> get props => [category];

}