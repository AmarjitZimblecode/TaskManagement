import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../helpers/color_helper.dart';
import '../../network_manager/intercepter.dart';
import '../../utils/common_toast.dart';
import '../../utils/connectivity.dart';
import '../get_todo_list/get_todo_list_cubit.dart';

part 'delete_todo_state.dart';

class DeleteTodoCubit extends Cubit<DeleteTodoState> {
  DeleteTodoCubit() : super(DeleteTodoInitial());


  deleteTodo (BuildContext context, String taskId) async{


    if(!await isNetworkAvailable()){

    commonToast(context, 'Please check your internet', ColorHelper.instance.redColor);

    }else{
    emit(DeleteTodoLoading());

    await restClient.deleteTodo(taskId).then((value){

      commonToast(context, 'Delete Successfully', ColorHelper.instance.greenColor);
      context.read<GetTodoListCubit>().getTodoList(false);
    emit(DeleteTodoLoaded());


    }).onError((error, stackTrace){
    commonToast(context, 'Something went wrong', ColorHelper.instance.redColor);
    emit(DeleteTodoError());
    });

    }
  }
}