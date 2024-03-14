// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as int?,
      task_name: json['task_name'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'task_name': instance.task_name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'status': instance.status,
    };
