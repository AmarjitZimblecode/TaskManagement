import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/done_todo/done_todo_cubit.dart';
import '../helpers/color_helper.dart';
import '../helpers/constant_helper.dart';

class ChangeStatusWidget extends StatelessWidget {
  final int status;
  final String id;
  const ChangeStatusWidget({super.key, required this.status, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoneTodoCubit(),
      child: BlocConsumer<DoneTodoCubit, DoneTodoState>(
          listener: (context, state) => debugPrint(state.toString()),
          builder: (context, DoneTodoState state) {
            return GestureDetector(
              onTap: (){
                if(state is DoneTodoLoading){

                }else {
                  if(status == 0){
                    context.read<DoneTodoCubit>().doneTodo(context, id);
                  }
                }
              },
              child: Container(
                height: 40,width:status == 0?120:70,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: ConstantHelper.instance.size_8, horizontal: ConstantHelper.instance.size_12),
                decoration: BoxDecoration(
                  color: status == 0?ColorHelper.instance.blueColor:ColorHelper.instance.greenColor,
                  borderRadius: BorderRadius.circular(ConstantHelper.instance.size_30),
                ),
                child: state is DoneTodoLoading?
                const SizedBox(
                    height: 30,width: 30,
                    child: CircularProgressIndicator(color: Colors.white,)):
                Text(status == 0?
                'Mark as Done' : 'Done',
                  style: TextStyle(
                      color: ColorHelper.instance.whiteColor,
                      fontWeight: ConstantHelper.instance.w500,
                      fontSize: ConstantHelper.instance.size_14
                  ),),
              ),
            );
          }
      ),
    );
  }
}