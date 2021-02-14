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
      ..teamName = fields[0] as String
      ..genre = fields[1] as String
      ..tournamentName = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, FavoriteTeam obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.teamName)
      ..writeByte(1)
      ..write(obj.genre)
      ..writeByte(2)
      ..write(obj.tournamentName);
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
