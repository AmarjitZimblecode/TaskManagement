part of 'done_todo_cubit.dart';

@immutable
abstract class DoneTodoState {}

class DoneTodoInitial extends DoneTodoState {}

class DoneTodoLoading extends DoneTodoState {}

class DoneTodoLoaded extends DoneTodoState {}

class DoneTodoError extends DoneTodoState {}