import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bilhete_comprado_record.g.dart';

abstract class BilheteCompradoRecord
    implements Built<BilheteCompradoRecord, BilheteCompradoRecordBuilder> {
  static Serializer<BilheteCompradoRecord> get serializer =>
      _$bilheteCompradoRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'status_de_pagamento')
  bool get statusDePagamento;

  @nullable
  String get destino;

  @nullable
  @BuiltValueField(wireName: 'data_viagem')
  DateTime get dataViagem;

  @nullable
  @BuiltValueField(wireName: 'quant_adulto')
  int get quantAdulto;

  @nullable
  @BuiltValueField(wireName: 'quant_crianca')
  int get quantCrianca;

  @nullable
  @BuiltValueField(wireName: 'total_passagem')
  double get totalPassagem;

  @nullable
  @BuiltValueField(wireName: 'user_comprador')
  DocumentReference get userComprador;

  @nullable
  @BuiltValueField(wireName: 'bilhete_passagem')
  DocumentReference get bilhetePassagem;

  @nullable
  @BuiltValueField(wireName: 'id_bilhete_passagem')
  int get idBilhetePassagem;

  @nullable
  @BuiltValueField(wireName: 'criado_em')
  DateTime get criadoEm;

  @nullable
  @BuiltValueField(wireName: 'id_bilhete')
  String get idBilhete;

  @nullable
  @BuiltValueField(wireName: 'subtotal_adulto')
  double get subtotalAdulto;

  @nullable
  @BuiltValueField(wireName: 'subtotal_crianca')
  double get subtotalCrianca;

  @nullable
  @BuiltValueField(wireName: 'preco_adulto')
  double get precoAdulto;

  @nullable
  @BuiltValueField(wireName: 'preco_crianca')
  double get precoCrianca;

  @nullable
  @BuiltValueField(wireName: 'total_passagens')
  double get totalPassagens;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BilheteCompradoRecordBuilder builder) =>
      builder
        ..statusDePagamento = false
        ..destino = ''
        ..quantAdulto = 0
        ..quantCrianca = 0
        ..totalPassagem = 0.0
        ..idBilhetePassagem = 0
        ..idBilhete = ''
        ..subtotalAdulto = 0.0
        ..subtotalCrianca = 0.0
        ..precoAdulto = 0.0
        ..precoCrianca = 0.0
        ..totalPassagens = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bilhete_comprado');

  static Stream<BilheteCompradoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BilheteCompradoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BilheteCompradoRecord._();
  factory BilheteCompradoRecord(
          [void Function(BilheteCompradoRecordBuilder) updates]) =
      _$BilheteCompradoRecord;

  static BilheteCompradoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBilheteCompradoRecordData({
  bool statusDePagamento,
  String destino,
  DateTime dataViagem,
  int quantAdulto,
  int quantCrianca,
  double totalPassagem,
  DocumentReference userComprador,
  DocumentReference bilhetePassagem,
  int idBilhetePassagem,
  DateTime criadoEm,
  String idBilhete,
  double subtotalAdulto,
  double subtotalCrianca,
  double precoAdulto,
  double precoCrianca,
  double totalPassagens,
}) =>
    serializers.toFirestore(
        BilheteCompradoRecord.serializer,
        BilheteCompradoRecord((b) => b
          ..statusDePagamento = statusDePagamento
          ..destino = destino
          ..dataViagem = dataViagem
          ..quantAdulto = quantAdulto
          ..quantCrianca = quantCrianca
          ..totalPassagem = totalPassagem
          ..userComprador = userComprador
          ..bilhetePassagem = bilhetePassagem
          ..idBilhetePassagem = idBilhetePassagem
          ..criadoEm = criadoEm
          ..idBilhete = idBilhete
          ..subtotalAdulto = subtotalAdulto
          ..subtotalCrianca = subtotalCrianca
          ..precoAdulto = precoAdulto
          ..precoCrianca = precoCrianca
          ..totalPassagens = totalPassagens));
