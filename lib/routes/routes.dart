import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/models/todo_list_model.dart';
import 'package:task_management/routes/routes_name.dart';
import 'package:task_management/screens/no_route_found.dart';
import 'package:task_management/screens/todo_list_screen.dart';
import '../cubits/get_todo_list/get_todo_list_cubit.dart';
import '../screens/add_todo_screen.dart';

class Routes {

  static Route<dynamic> generateRoute (RouteSettings settings) {

    switch (settings.name){


      case RouteName.todoList:
        return MaterialPageRoute(builder: (context)=>
            BlocProvider(
                create: (BuildContext context) => GetTodoListCubit(),
                child: const TodoListScreen(),),);

      case RouteName.addTodo:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (context)=> AddTodoScreen(data: args,));

      default:
        return MaterialPageRoute(builder: (context)=> const NoRouteFoundScreen());
    }
  }

}