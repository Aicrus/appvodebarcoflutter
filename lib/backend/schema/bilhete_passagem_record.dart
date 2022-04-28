import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bilhete_passagem_record.g.dart';

abstract class BilhetePassagemRecord
    implements Built<BilhetePassagemRecord, BilhetePassagemRecordBuilder> {
  static Serializer<BilhetePassagemRecord> get serializer =>
      _$bilhetePassagemRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'cidade_origem')
  String get cidadeOrigem;

  @nullable
  @BuiltValueField(wireName: 'cidade_destino')
  String get cidadeDestino;

  @nullable
  @BuiltValueField(wireName: 'preco_adulto')
  double get precoAdulto;

  @nullable
  @BuiltValueField(wireName: 'preco_crianca')
  double get precoCrianca;

  @nullable
  @BuiltValueField(wireName: 'hora_ida')
  String get horaIda;

  @nullable
  @BuiltValueField(wireName: 'hora_chegada')
  String get horaChegada;

  @nullable
  bool get destaque;

  @nullable
  @BuiltValueField(wireName: 'imagem_destino')
  String get imagemDestino;

  @nullable
  DocumentReference get embarcacao;

  @nullable
  @BuiltValueField(wireName: 'id_bilhete_passagem')
  int get idBilhetePassagem;

  @nullable
  @BuiltValueField(wireName: 'id_embarcacao')
  String get idEmbarcacao;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BilhetePassagemRecordBuilder builder) =>
      builder
        ..cidadeOrigem = ''
        ..cidadeDestino = ''
        ..precoAdulto = 0.0
        ..precoCrianca = 0.0
        ..horaIda = ''
        ..horaChegada = ''
        ..destaque = false
        ..imagemDestino = ''
        ..idBilhetePassagem = 0
        ..idEmbarcacao = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bilhete_passagem');

  static Stream<BilhetePassagemRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BilhetePassagemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BilhetePassagemRecord._();
  factory BilhetePassagemRecord(
          [void Function(BilhetePassagemRecordBuilder) updates]) =
      _$BilhetePassagemRecord;

  static BilhetePassagemRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBilhetePassagemRecordData({
  String cidadeOrigem,
  String cidadeDestino,
  double precoAdulto,
  double precoCrianca,
  String horaIda,
  String horaChegada,
  bool destaque,
  String imagemDestino,
  DocumentReference embarcacao,
  int idBilhetePassagem,
  String idEmbarcacao,
}) =>
    serializers.toFirestore(
        BilhetePassagemRecord.serializer,
        BilhetePassagemRecord((b) => b
          ..cidadeOrigem = cidadeOrigem
          ..cidadeDestino = cidadeDestino
          ..precoAdulto = precoAdulto
          ..precoCrianca = precoCrianca
          ..horaIda = horaIda
          ..horaChegada = horaChegada
          ..destaque = destaque
          ..imagemDestino = imagemDestino
          ..embarcacao = embarcacao
          ..idBilhetePassagem = idBilhetePassagem
          ..idEmbarcacao = idEmbarcacao));
