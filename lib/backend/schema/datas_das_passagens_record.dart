import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'datas_das_passagens_record.g.dart';

abstract class DatasDasPassagensRecord
    implements Built<DatasDasPassagensRecord, DatasDasPassagensRecordBuilder> {
  static Serializer<DatasDasPassagensRecord> get serializer =>
      _$datasDasPassagensRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'dia_numero')
  int get diaNumero;

  @nullable
  @BuiltValueField(wireName: 'dia_semana')
  String get diaSemana;

  @nullable
  String get mes;

  @nullable
  DateTime get data;

  @nullable
  @BuiltValueField(wireName: 'bilhete_passagem')
  DocumentReference get bilhetePassagem;

  @nullable
  @BuiltValueField(wireName: 'mes_numero')
  int get mesNumero;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DatasDasPassagensRecordBuilder builder) =>
      builder
        ..diaNumero = 0
        ..diaSemana = ''
        ..mes = ''
        ..mesNumero = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('datas_das_passagens');

  static Stream<DatasDasPassagensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DatasDasPassagensRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DatasDasPassagensRecord._();
  factory DatasDasPassagensRecord(
          [void Function(DatasDasPassagensRecordBuilder) updates]) =
      _$DatasDasPassagensRecord;

  static DatasDasPassagensRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDatasDasPassagensRecordData({
  int diaNumero,
  String diaSemana,
  String mes,
  DateTime data,
  DocumentReference bilhetePassagem,
  int mesNumero,
}) =>
    serializers.toFirestore(
        DatasDasPassagensRecord.serializer,
        DatasDasPassagensRecord((d) => d
          ..diaNumero = diaNumero
          ..diaSemana = diaSemana
          ..mes = mes
          ..data = data
          ..bilhetePassagem = bilhetePassagem
          ..mesNumero = mesNumero));
