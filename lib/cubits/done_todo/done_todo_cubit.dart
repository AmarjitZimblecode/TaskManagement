import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../helpers/color_helper.dart';
import '../../models/add_todo_model.dart';
import '../../network_manager/intercepter.dart';
import '../../utils/common_toast.dart';
import '../../utils/connectivity.dart';
import '../get_todo_list/get_todo_list_cubit.dart';
part 'done_todo_state.dart';

class DoneTodoCubit extends Cubit<DoneTodoState> {
  DoneTodoCubit() : super(DoneTodoInitial());


  doneTodo (BuildContext context, String taskId) async{
    if(!await isNetworkAvailable()){

      commonToast(context, 'Please check your internet', ColorHelper.instance.redColor);

    }else{
      emit(DoneTodoLoading());

      await restClient.doneDodo(taskId).then((value){

        context.read<GetTodoListCubit>().getTodoList(false);
        emit(DoneTodoLoaded());


      }).onError((error, stackTrace){
        emit(DoneTodoError());
        commonToast(context, 'Something went wrong', ColorHelper.instance.redColor);
      });

    }
  }

}