import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/delete_todo/delete_todo_cubit.dart';
import '../helpers/color_helper.dart';

class DeleteButtonWidget extends StatelessWidget {
  final String id;
  const DeleteButtonWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DeleteTodoCubit(),
      child: BlocConsumer<DeleteTodoCubit, DeleteTodoState>(
          listener: (context, state) => debugPrint(state.toString()),
          builder: (context, DeleteTodoState state) {
            return IconButton(
                onPressed: (){
                  if(state is DeleteTodoLoading){
                  }else{
                    context.read<DeleteTodoCubit>().deleteTodo(context, id);
                  }
                },
                icon: state is DeleteTodoLoading? CircularProgressIndicator(color: ColorHelper.instance.blackColor,): Icon(Icons.delete, color: ColorHelper.instance.redColor,));
          }
      ),
    );
  }
}