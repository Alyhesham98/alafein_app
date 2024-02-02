import 'package:flutter/material.dart';

class Days {
  final String name;
  final int id;
  TimeOfDay? opening;
  TimeOfDay? closing;
  bool? isOpen;
  Days({
    required this.name,
    required this.id,
    required this.opening,
    required this.closing,
    required this.isOpen,
  });
}
