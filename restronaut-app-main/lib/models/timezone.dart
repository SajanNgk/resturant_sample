// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'timezone.g.dart';

@JsonSerializable()
class Timezone {
  String offset;
  String description;

  Timezone({
    required this.offset,
    required this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneToJson(this);
}

class Time_Zone {
  static Widget show_time() {
    var current_time = DateTime.now();
    String formattedTime = DateFormat('h : mm ').format(current_time);
    return Text(
      formattedTime.toString(),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
