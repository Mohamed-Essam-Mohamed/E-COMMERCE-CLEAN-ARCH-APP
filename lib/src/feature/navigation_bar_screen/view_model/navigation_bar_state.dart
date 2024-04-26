part of 'navigation_bar_cubit.dart';

@immutable
sealed class NavigationBarState {}

final class NavigationBarInitial extends NavigationBarState {}

final class NavigationBarChangeIndexState extends NavigationBarState {}
