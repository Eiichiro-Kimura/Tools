// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_team.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteTeamAdapter extends TypeAdapter<FavoriteTeam> {
  @override
  final int typeId = 0;

  @override
  FavoriteTeam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteTeam()
      ..genre = fields[0] as String
      ..teamName = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, FavoriteTeam obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.genre)
      ..writeByte(1)
      ..write(obj.teamName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteTeamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
