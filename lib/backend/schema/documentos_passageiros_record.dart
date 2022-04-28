import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'documentos_passageiros_record.g.dart';

abstract class DocumentosPassageirosRecord
    implements
        Built<DocumentosPassageirosRecord, DocumentosPassageirosRecordBuilder> {
  static Serializer<DocumentosPassageirosRecord> get serializer =>
      _$documentosPassageirosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nome_completo')
  String get nomeCompleto;

  @nullable
  @BuiltValueField(wireName: 'numero_rg')
  String get numeroRg;

  @nullable
  @BuiltValueField(wireName: 'id_bilhete')
  String get idBilhete;

  @nullable
  @BuiltValueField(wireName: 'bilhete_comprado')
  DocumentReference get bilheteComprado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DocumentosPassageirosRecordBuilder builder) =>
      builder
        ..nomeCompleto = ''
        ..numeroRg = ''
        ..idBilhete = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documentos_passageiros');

  static Stream<DocumentosPassageirosRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DocumentosPassageirosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DocumentosPassageirosRecord._();
  factory DocumentosPassageirosRecord(
          [void Function(DocumentosPassageirosRecordBuilder) updates]) =
      _$DocumentosPassageirosRecord;

  static DocumentosPassageirosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDocumentosPassageirosRecordData({
  String nomeCompleto,
  String numeroRg,
  String idBilhete,
  DocumentReference bilheteComprado,
}) =>
    serializers.toFirestore(
        DocumentosPassageirosRecord.serializer,
        DocumentosPassageirosRecord((d) => d
          ..nomeCompleto = nomeCompleto
          ..numeroRg = numeroRg
          ..idBilhete = idBilhete
          ..bilheteComprado = bilheteComprado));
