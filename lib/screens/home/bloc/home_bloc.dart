import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {

    /// change selected page
    on<HomeCategoryChanged>((event, emit) {
      emit(state.copyWith(category: state.category.copyWith(label: event.category.label,)));
    });

  }
}