import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/models/todo_list_model.dart';
import 'package:task_management/network_manager/intercepter.dart';
import '../../utils/connectivity.dart';
part 'get_todo_list_state.dart';

class GetTodoListCubit extends Cubit<GetTodoListState> {
  GetTodoListCubit() : super(GetTodoListInitial());


  getTodoList (bool showLoading) async{
    if(!await isNetworkAvailable()){
      emit(GetTodoListNetworkConnectionError());

    }else{
      if(showLoading){
        emit(GetTodoListLoading());
      }


      restClient.getTodoList().then((value){

        if(value.isEmpty){
          emit(GetTodoListIsEmpty());

        }else{

          List<TodoListModel> pendingTodoList = [];
          List<TodoListModel> doneTodoList = [];

          for (var todo in value){
            if(todo.status == 0){
              pendingTodoList.add(todo);
            }else{
              doneTodoList.add(todo);
            }
          }
          emit(GetTodoListLoaded(value, pendingTodoList, doneTodoList));

        }

      }).onError((error, stackTrace){
        emit(GetTodoListError(error.toString()));
      });

    }
  }
}