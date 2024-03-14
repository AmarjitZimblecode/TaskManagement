// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) =>
    TodoListModel(
      id: json['id'] as int?,
      task_name: json['task_name'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$TodoListModelToJson(TodoListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_name': instance.task_name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'status': instance.status,
    };
