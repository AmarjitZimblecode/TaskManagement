import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/utils/date_convert.dart';
import '../app_widgets/change_status_widget.dart';
import '../app_widgets/delete_button.dart';
import '../cubits/get_todo_list/get_todo_list_cubit.dart';
import '../helpers/color_helper.dart';
import '../helpers/constant_helper.dart';
import '../models/todo_list_model.dart';
import '../routes/routes_name.dart';

class ViewTodoList extends StatelessWidget {
  final List<TodoListModel> todoListModel;
  const ViewTodoList({super.key, required this.todoListModel});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: todoListModel.length,
        // reverse: true,
        padding: EdgeInsets.all(ConstantHelper.instance.size_12,),
        separatorBuilder: (context, i)=> SizedBox(height: ConstantHelper.instance.size_12),
        itemBuilder: (context, index){
          final data = todoListModel[index];
          return GestureDetector(
            onTap: ()async{
              var addNewTask = await Navigator.pushNamed(context, RouteName.addTodo, arguments: {
                'isNewTask' : false,
                "data" : data
              });
              if(addNewTask == true){
                context.read<GetTodoListCubit>().getTodoList(true);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: ConstantHelper.instance.size_12, vertical: ConstantHelper.instance.size_8),
              decoration: BoxDecoration(
                color: ColorHelper.instance.grey100,
                borderRadius: BorderRadius.circular(ConstantHelper.instance.size_12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(data.task_name??"",
                          style: TextStyle(
                              color: ColorHelper.instance.blackColor,
                              fontSize: ConstantHelper.instance.size_20,
                              fontWeight: ConstantHelper.instance.w500
                          ),),
                      ),
                      DeleteButtonWidget(id: data.id.toString())
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: ConstantHelper.instance.size_8,
                        top: ConstantHelper.instance.size_16
                    ),
                    child: const Divider(),
                  ),

                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: ColorHelper.instance.blackColor,size: ConstantHelper.instance.size_16,),
                      SizedBox(width: ConstantHelper.instance.size_8,),
                      Text(dateConvert(data.created_at??""),
                        style: TextStyle(
                            color: ColorHelper.instance.blackColor,
                            fontSize: ConstantHelper.instance.size_14,
                            fontWeight: ConstantHelper.instance.w400
                        ),),
                      const Spacer(),
                      ChangeStatusWidget(status: data.status??0, id: data.id.toString())
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}