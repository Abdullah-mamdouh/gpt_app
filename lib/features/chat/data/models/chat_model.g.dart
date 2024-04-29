// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatModelAdapter extends TypeAdapter<ChatModel> {
  @override
  final int typeId = 1;

  @override
  ChatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatModel(
      message: fields[1] as Message,
      index: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ChatModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'index': instance.index,
      'message': instance.message,
    };
