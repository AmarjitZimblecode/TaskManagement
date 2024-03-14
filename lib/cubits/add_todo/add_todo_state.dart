part of 'add_todo_cubit.dart';

@immutable
abstract class AddTodoState {}

class AddTodoInitial extends AddTodoState {}

class AddTodoLoading extends AddTodoState {}

class AddTodoLoaded extends AddTodoState {
  final TodoModel todoModel;
  AddTodoLoaded(this.todoModel);
}

class AddTodoError extends AddTodoState {
  final String errorMessage;
  AddTodoError(this.errorMessage);
}