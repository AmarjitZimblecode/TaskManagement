import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/app_widgets/text_field_widget.dart';
import 'package:task_management/cubits/add_todo/add_todo_cubit.dart';
import 'package:task_management/helpers/constant_helper.dart';
import 'package:task_management/models/todo_list_model.dart';
import 'package:task_management/utils/common_toast.dart';
import '../helpers/color_helper.dart';

class AddTodoScreen extends StatefulWidget {
  final Map data;
  const AddTodoScreen({super.key, required this.data});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {

  TextEditingController taskNameController = TextEditingController();
  TodoListModel? todoListModel;
  bool? isNewTask;

  @override
  void initState() {
    if(widget.data.containsKey('isNewTask')){
      isNewTask = widget.data['isNewTask'];
      print(isNewTask);
    }
    if(widget.data.containsKey('data')){
      todoListModel = widget.data['data'];
      taskNameController.text = todoListModel?.task_name??"";
      print(todoListModel);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorHelper.instance.whiteColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios, color: ColorHelper.instance.blackColor,)),
        backgroundColor: ColorHelper.instance.whiteColor,
        centerTitle: true,
        title: Text(isNewTask == true?"Add Todo" : "Update Todo"),
      ),

      body: Padding(
        padding: EdgeInsets.only(
          top: ConstantHelper.instance.size_12,
          left: ConstantHelper.instance.size_12,
          right: ConstantHelper.instance.size_12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
                hintText: 'Task Name',
                autoFocus: isNewTask == true?true:false,
                controller: taskNameController,
            ),
          ],
        ),
      ),

      floatingActionButton: BlocProvider(
        create: (BuildContext context) => AddTodoCubit(),
        child: BlocConsumer<AddTodoCubit, AddTodoState>(
          listener: (context, state) {
            if(state is AddTodoLoaded){
              Navigator.pop(context, true);
            }
          },
          builder: (BuildContext context, AddTodoState state) {
            return FloatingActionButton(
                backgroundColor: ColorHelper.instance.blackColor,
                child: state is AddTodoLoading ? CircularProgressIndicator(color: ColorHelper.instance.whiteColor,)
                :Icon(Icons.done, color: ColorHelper.instance.whiteColor,),
                onPressed: (){
                  if(taskNameController.text.isEmpty){
                    commonToast(context, "Task name can't be empty", ColorHelper.instance.redColor);
                  }else{
                    context.read<AddTodoCubit>().addTodo(
                        context, taskNameController.text.toString(), todoListModel?.id?.toString()??"");
                  }
                }
            );
          },
        ),
      ),

      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ColorHelper.instance.grey300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ConstantHelper.instance.size_12),
            topRight: Radius.circular(ConstantHelper.instance.size_12),
          )
        ),
      ),
    );
  }
}