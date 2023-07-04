import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

final class Category extends Equatable {

  /// page labels
  static const String ride = 'Ride';
  static const String eat = 'Eat';
  static const String grocery = 'Grocery';
  static const String shop = 'Shop';

  /// pages
  static const all = [
    Category(label: ride,),
    Category(label: eat,),
    Category(label: grocery,),
    Category(label: shop,),
  ];

  /// page name
  final String label;

  const Category({
    required this.label,
  });

  Category copyWith({String? label,}) {
    return Category(
      label: label ?? this.label,
    );
  }

  @override
  List<Object?> get props => [label];

}