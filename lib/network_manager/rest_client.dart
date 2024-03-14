import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_management/models/add_todo_model.dart';
import '../models/todo_list_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api-medyseva-saas.tejpage.com/api/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/todo')
  Future<List<TodoListModel>> getTodoList();

  @POST('/todo')
  Future<TodoModel> addTodo(@Field("task_name") String taskName);

  @PUT('/todo/{id}')
  Future<TodoModel> updateTodo(@Path('id') String id, @Field("task_name") String taskName);

  @POST('/todo/{id}')
  Future<TodoModel> doneDodo(@Path('id') String id);

  @DELETE('/todo/{id}')
  Future<TodoModel> deleteTodo(@Path('id') String id);

}