import 'package:json_annotation/json_annotation.dart';

part 'todo_list_model.g.dart';

@JsonSerializable()
class TodoListModel {
  int? id;
  String? task_name;
  String? created_at;
  String? updated_at;
  int? status;

  TodoListModel(
      {this.id, this.task_name, this.created_at, this.updated_at, this.status});

  factory TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListModelToJson(this);
}