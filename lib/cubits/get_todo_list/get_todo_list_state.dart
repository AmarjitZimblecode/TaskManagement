part of 'get_todo_list_cubit.dart';

@immutable
abstract class GetTodoListState {}

class GetTodoListInitial extends GetTodoListState {}

class GetTodoListNetworkConnectionError extends GetTodoListState {}

class GetTodoListLoading extends GetTodoListState {}

class GetTodoListIsEmpty extends GetTodoListState {}

class GetTodoListLoaded extends GetTodoListState {
  final List<TodoListModel> getAllTodoList;
  final List<TodoListModel> getPendingTodoList;
  final List<TodoListModel> getDoneTodoList;
  GetTodoListLoaded(this.getAllTodoList, this.getPendingTodoList, this.getDoneTodoList);
}

class GetTodoListError extends GetTodoListState {
  final String errorMessage;
  GetTodoListError(this.errorMessage);
}