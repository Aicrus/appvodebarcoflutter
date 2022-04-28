import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String idFunction(String id) {
  // Add your function code here!
  String _randomString = id.toString() +
      math.Random().nextInt(9999).toString() +
      math.Random().nextInt(9999).toString() +
      math.Random().nextInt(9999).toString();
  return _randomString;
}

double somarSubtotal(
  double subtotal,
  double preco,
) {
  // Add your function code here!
  double nsubtotal = subtotal + preco;
  return nsubtotal;
}

double subtrairSubtotal(
  double subtotal,
  double preco,
) {
  // Add your function code here!
  double nsubtotal = subtotal - preco;
  return nsubtotal;
}

double totalPassagens(
  double subAdultos,
  double subCriancas,
) {
  // Add your function code here!
  double total = subAdultos + subCriancas;

  String inString = total.toStringAsFixed(2);
  double inDouble = double.parse(inString);
  return inDouble;
  return total;
}
