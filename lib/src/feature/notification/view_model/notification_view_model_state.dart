part of 'notification_view_model_cubit.dart';

@immutable
abstract class NotificationViewModelState {}

class NotificationViewModelInitial extends NotificationViewModelState {}

class NotificationViewModelLoading extends NotificationViewModelState {}

class NotificationViewModelSuccess extends NotificationViewModelState {}

class NotificationViewModelError extends NotificationViewModelState {
  final String message;
  NotificationViewModelError({required this.message});
}
