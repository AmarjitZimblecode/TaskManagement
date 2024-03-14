import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_management/helpers/color_helper.dart';
import 'package:task_management/models/add_todo_model.dart';
import 'package:task_management/utils/common_toast.dart';
import '../../network_manager/intercepter.dart';
import '../../utils/connectivity.dart';
part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit() : super(AddTodoInitial());

  addTodo(BuildContext context, String taskName, String taskId) async {
    if (!await isNetworkAvailable()) {
      commonToast(context, 'Please check your internet', ColorHelper.instance.redColor);
    } else {
      emit(AddTodoLoading());

      if (taskId == "" || taskId == "null") {
        restClient.addTodo(taskName).then((value) {
          emit(AddTodoLoaded(value));
        }).onError((error, stackTrace) {
          commonToast(
              context, 'Something went wrong', ColorHelper.instance.redColor);
          emit(AddTodoError(error.toString()));
        });
      } else {
        restClient.updateTodo(taskId, taskName).then((value) {
          emit(AddTodoLoaded(value));
        }).onError((error, stackTrace) {
          commonToast(
              context, 'Something went wrong', ColorHelper.instance.redColor);
          emit(AddTodoError(error.toString()));
        });
      }
    }
  }
}