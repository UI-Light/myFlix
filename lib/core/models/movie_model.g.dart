// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      movieTitle: fields[0] as String,
      posterUrl: fields[1] as String,
      backdropUrl: fields[3] as String,
      overview: fields[2] as String,
      year: fields[4] as String,
      averageRating: fields[5] as num,
      movieId: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.movieTitle)
      ..writeByte(1)
      ..write(obj.posterUrl)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.backdropUrl)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.averageRating)
      ..writeByte(6)
      ..write(obj.movieId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
