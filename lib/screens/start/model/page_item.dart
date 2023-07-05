import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class PageItem extends Equatable {

  /// page labels
  static const String home = 'Home';
  static const String services = 'Services';
  static const String myOrders = 'My Orders';
  static const String myAccounts = 'My Account';

  /// pages
  static const pages = [
    PageItem(name: home, icon: Icons.home_outlined),
    PageItem(name: services, icon: Icons.padding),
    PageItem(name: myOrders, icon: Icons.shopping_bag_outlined),
    PageItem(name: myAccounts, icon: CupertinoIcons.person),
  ];

  /// page name
  final String name;

  /// icon data
  final IconData icon;

  const PageItem({
    required this.name,
    required this.icon,
  });

  PageItem copyWith({String? name, IconData? icon}) {
    return PageItem(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [name, icon];

}