import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  int get typeId =>
      0; // this is unique identifier for Color. If you add more adapters, make sure to increment this

  @override
  Color read(BinaryReader reader) {
    final intValue = reader.readInt();
    return Color(intValue);
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value);
  }
}
