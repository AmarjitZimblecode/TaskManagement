import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/helpers/assets_healper.dart';
import 'package:task_management/helpers/color_helper.dart';
import 'package:task_management/helpers/constant_helper.dart';
import 'package:task_management/routes/routes_name.dart';
import 'package:task_management/screens/view_todo_list.dart';
import '../cubits/get_todo_list/get_todo_list_cubit.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<GetTodoListCubit>().getTodoList(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.instance.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorHelper.instance.whiteColor,
        centerTitle: true,
        title: const Text('Todo List'),
        leading: Container(
          margin: EdgeInsets.all(ConstantHelper.instance.size_8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ConstantHelper.instance.size_8),
            image: DecorationImage(
                image: AssetImage(AssetsHelper.instance.appLogo))
          ),
        ),
      ),


      body: Column(
        children: [

          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                surfaceVariant: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ConstantHelper.instance.size_12, vertical: ConstantHelper.instance.size_6),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: ConstantHelper.instance.size_18,
                    fontWeight: ConstantHelper.instance.w500),
                unselectedLabelStyle: TextStyle(fontSize: ConstantHelper.instance.size_18,),
                indicator: BoxDecoration(
                  color: ColorHelper.instance.blackColor,
                  borderRadius: BorderRadius.circular(ConstantHelper.instance.size_30),
                ),
                tabs: const <Widget>[
                  Tab(icon: Text('All'),),
                  Tab(icon: Text('Todo'),),
                  Tab(icon: Text('Done'),),
                ],
              ),
            ),
          ),

          Expanded(
            child: BlocConsumer<GetTodoListCubit, GetTodoListState>(
              listener: (context, state) => debugPrint(state.toString()),
                builder: (BuildContext context, GetTodoListState state) {
                if(state is GetTodoListNetworkConnectionError){
                  return const Center(child:Text('Please Check your internet'),);
                }else if (state is GetTodoListLoading){
                  return Center(child: CircularProgressIndicator(color: ColorHelper.instance.blackColor,),);
                }else if (state is GetTodoListError){
                  return const Center(child:Text("Something went wrong"),);
                }else if (state is GetTodoListLoaded){
                  return TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ViewTodoList(todoListModel: state.getAllTodoList,),
                      ViewTodoList(todoListModel: state.getPendingTodoList,),
                      ViewTodoList(todoListModel: state.getDoneTodoList,),
                    ],
                  );
                }
                return const SizedBox();
              }
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorHelper.instance.blackColor,
          child: Icon(Icons.add, color: ColorHelper.instance.whiteColor,),
          onPressed: ()async{
            var addNewTask = await Navigator.pushNamed(context, RouteName.addTodo, arguments: {'isNewTask' : true});
          if(addNewTask == true){
            context.read<GetTodoListCubit>().getTodoList(true);
          }
          }
      ),
    );
  }
}