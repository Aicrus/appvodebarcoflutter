import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'embarcacoes_record.g.dart';

abstract class EmbarcacoesRecord
    implements Built<EmbarcacoesRecord, EmbarcacoesRecordBuilder> {
  static Serializer<EmbarcacoesRecord> get serializer =>
      _$embarcacoesRecordSerializer;

  @nullable
  String get nome;

  @nullable
  String get sobre;

  @nullable
  String get imagem;

  @nullable
  @BuiltValueField(wireName: 'id_embarcacao')
  String get idEmbarcacao;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EmbarcacoesRecordBuilder builder) => builder
    ..nome = ''
    ..sobre = ''
    ..imagem = ''
    ..idEmbarcacao = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('embarcacoes');

  static Stream<EmbarcacoesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EmbarcacoesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EmbarcacoesRecord._();
  factory EmbarcacoesRecord([void Function(EmbarcacoesRecordBuilder) updates]) =
      _$EmbarcacoesRecord;

  static EmbarcacoesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEmbarcacoesRecordData({
  String nome,
  String sobre,
  String imagem,
  String idEmbarcacao,
}) =>
    serializers.toFirestore(
        EmbarcacoesRecord.serializer,
        EmbarcacoesRecord((e) => e
          ..nome = nome
          ..sobre = sobre
          ..imagem = imagem
          ..idEmbarcacao = idEmbarcacao));
