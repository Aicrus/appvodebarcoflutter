import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bilhete_passagens_record.g.dart';

abstract class BilhetePassagensRecord
    implements Built<BilhetePassagensRecord, BilhetePassagensRecordBuilder> {
  static Serializer<BilhetePassagensRecord> get serializer =>
      _$bilhetePassagensRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Origem_viagem')
  String get origemViagem;

  @nullable
  @BuiltValueField(wireName: 'Destino_viagem')
  String get destinoViagem;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BilhetePassagensRecordBuilder builder) =>
      builder
        ..origemViagem = ''
        ..destinoViagem = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Bilhete_passagens');

  static Stream<BilhetePassagensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BilhetePassagensRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BilhetePassagensRecord._();
  factory BilhetePassagensRecord(
          [void Function(BilhetePassagensRecordBuilder) updates]) =
      _$BilhetePassagensRecord;

  static BilhetePassagensRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBilhetePassagensRecordData({
  String origemViagem,
  String destinoViagem,
}) =>
    serializers.toFirestore(
        BilhetePassagensRecord.serializer,
        BilhetePassagensRecord((b) => b
          ..origemViagem = origemViagem
          ..destinoViagem = destinoViagem));
