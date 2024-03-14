part of 'delete_todo_cubit.dart';

@immutable
abstract class DeleteTodoState {}

class DeleteTodoInitial extends DeleteTodoState {}

class DeleteTodoNetworkError extends DeleteTodoState {}

class DeleteTodoLoading extends DeleteTodoState {}

class DeleteTodoLoaded extends DeleteTodoState {}

class DeleteTodoError extends DeleteTodoState {}