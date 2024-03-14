import 'package:json_annotation/json_annotation.dart';

part 'add_todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  int? id;
  String? task_name;
  String? created_at;
  String? updated_at;
  int? status;

  TodoModel(
      {this.id, this.task_name, this.created_at, this.updated_at, this.status});

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}