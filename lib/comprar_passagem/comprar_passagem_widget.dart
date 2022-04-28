import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ComprarPassagemWidget extends StatefulWidget {
  const ComprarPassagemWidget({
    Key key,
    this.bilheteinfo,
  }) : super(key: key);

  final DocumentReference bilheteinfo;

  @override
  _ComprarPassagemWidgetState createState() => _ComprarPassagemWidgetState();
}

class _ComprarPassagemWidgetState extends State<ComprarPassagemWidget> {
  TextEditingController textFieldNomeCompletoRgController;
  TextEditingController textFieldNumeroRGController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldNomeCompletoRgController = TextEditingController();
    textFieldNumeroRGController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BilheteCompradoRecord>>(
      stream: queryBilheteCompradoRecord(
        queryBuilder: (bilheteCompradoRecord) => bilheteCompradoRecord
            .where('bilhete_passagem', isEqualTo: widget.bilheteinfo),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30,
              ),
            ),
          );
        }
        List<BilheteCompradoRecord> comprarPassagemBilheteCompradoRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final comprarPassagemBilheteCompradoRecord =
            comprarPassagemBilheteCompradoRecordList.isNotEmpty
                ? comprarPassagemBilheteCompradoRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: StreamBuilder<List<BilhetePassagemRecord>>(
              stream: queryBilhetePassagemRecord(
                queryBuilder: (bilhetePassagemRecord) =>
                    bilhetePassagemRecord.where('id_bilhete_passagem',
                        isEqualTo: comprarPassagemBilheteCompradoRecord
                            .idBilhetePassagem),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 30,
                      ),
                    ),
                  );
                }
                List<BilhetePassagemRecord> columnBilhetePassagemRecordList =
                    snapshot.data;
                // Return an empty Container when the document does not exist.
                if (snapshot.data.isEmpty) {
                  return Container();
                }
                final columnBilhetePassagemRecord =
                    columnBilhetePassagemRecordList.isNotEmpty
                        ? columnBilhetePassagemRecordList.first
                        : null;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StreamBuilder<List<EmbarcacoesRecord>>(
                        stream: queryEmbarcacoesRecord(
                          queryBuilder: (embarcacoesRecord) =>
                              embarcacoesRecord.where('id_embarcacao',
                                  isEqualTo:
                                      columnBilhetePassagemRecord.idEmbarcacao),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: SpinKitRipple(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
                                ),
                              ),
                            );
                          }
                          List<EmbarcacoesRecord> rowEmbarcacoesRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final rowEmbarcacoesRecord =
                              rowEmbarcacoesRecordList.isNotEmpty
                                  ? rowEmbarcacoesRecordList.first
                                  : null;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, -5.48),
                                        child: StreamBuilder<
                                            BilhetePassagemRecord>(
                                          stream:
                                              BilhetePassagemRecord.getDocument(
                                                  widget.bilheteinfo),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                ),
                                              );
                                            }
                                            final imageBilhetePassagemRecord =
                                                snapshot.data;
                                            return ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(32),
                                                bottomRight:
                                                    Radius.circular(32),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    columnBilhetePassagemRecord
                                                        .imagemDestino,
                                                width: double.infinity,
                                                height: 240,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 130, 15, 0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 155,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, -1.13),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 80, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              rowEmbarcacoesRecord
                                                                  .imagem,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              rowEmbarcacoesRecord
                                                                  .nome,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 10, 0),
                                                          child: Text(
                                                            formatNumber(
                                                              columnBilhetePassagemRecord
                                                                  .precoAdulto,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              currency: 'R\$',
                                                              format: '.00',
                                                              locale: '',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14, 14, 14, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          columnBilhetePassagemRecord
                                                              .cidadeOrigem,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFAD5111),
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '---  ⚓  ---',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFFC9C9C9),
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          columnBilhetePassagemRecord
                                                              .cidadeDestino,
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFA1A71B),
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14, 40, 14, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            columnBilhetePassagemRecord
                                                                .horaIda,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Duração\n12hs',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 12, 0),
                                                          child: Text(
                                                            columnBilhetePassagemRecord
                                                                .horaChegada,
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: Color(0xFFCDCDCD),
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child: Icon(
                                            Icons.date_range,
                                            color: Color(0xFFEA7A1E),
                                            size: 26,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              dateTimeFormat(
                                                  'd/M/y',
                                                  comprarPassagemBilheteCompradoRecord
                                                      .dataViagem),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color(0xFF979797),
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: Color(0xFFCDCDCD),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Adulto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Preço:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 0, 0, 0),
                                                        child: Text(
                                                          formatNumber(
                                                            comprarPassagemBilheteCompradoRecord
                                                                .precoAdulto,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'R\$',
                                                            format: '.00',
                                                            locale: '',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'SubTotal:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 0, 0, 0),
                                                        child: Text(
                                                          formatNumber(
                                                            comprarPassagemBilheteCompradoRecord
                                                                .subtotalAdulto,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'R\$',
                                                            format: '.00',
                                                            locale: '',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((comprarPassagemBilheteCompradoRecord
                                                      .quantAdulto) >
                                                  0)
                                                InkWell(
                                                  onTap: () async {
                                                    final bilheteCompradoUpdateData =
                                                        {
                                                      ...createBilheteCompradoRecordData(
                                                        subtotalAdulto: functions
                                                            .subtrairSubtotal(
                                                                comprarPassagemBilheteCompradoRecord
                                                                    .subtotalAdulto,
                                                                comprarPassagemBilheteCompradoRecord
                                                                    .precoAdulto),
                                                      ),
                                                      'quant_adulto':
                                                          FieldValue.increment(
                                                              -1),
                                                    };
                                                    await comprarPassagemBilheteCompradoRecord
                                                        .reference
                                                        .update(
                                                            bilheteCompradoUpdateData);
                                                  },
                                                  child: Icon(
                                                    Icons.remove_circle,
                                                    color: Color(0xFFFFAB61),
                                                    size: 28,
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 5, 0),
                                                child: Text(
                                                  comprarPassagemBilheteCompradoRecord
                                                      .quantAdulto
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final bilheteCompradoUpdateData =
                                                        {
                                                      ...createBilheteCompradoRecordData(
                                                        subtotalAdulto: functions
                                                            .somarSubtotal(
                                                                comprarPassagemBilheteCompradoRecord
                                                                    .subtotalAdulto,
                                                                comprarPassagemBilheteCompradoRecord
                                                                    .precoAdulto),
                                                      ),
                                                      'quant_adulto':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await comprarPassagemBilheteCompradoRecord
                                                        .reference
                                                        .update(
                                                            bilheteCompradoUpdateData);
                                                  },
                                                  child: Icon(
                                                    Icons.add_circle,
                                                    color: Color(0xFFEE8224),
                                                    size: 28,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: Color(0xFFCDCDCD),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Criança',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Preço:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 0, 0, 0),
                                                        child: Text(
                                                          formatNumber(
                                                            comprarPassagemBilheteCompradoRecord
                                                                .precoCrianca,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'R\$',
                                                            format: '.00',
                                                            locale: '',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'SubTotal:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 0, 0, 0),
                                                        child: Text(
                                                          formatNumber(
                                                            comprarPassagemBilheteCompradoRecord
                                                                .subtotalCrianca,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'R\$',
                                                            format: '.00',
                                                            locale: '',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final bilheteCompradoUpdateData =
                                                      createBilheteCompradoRecordData();
                                                  await comprarPassagemBilheteCompradoRecord
                                                      .reference
                                                      .update(
                                                          bilheteCompradoUpdateData);
                                                },
                                                child: Icon(
                                                  Icons.remove_circle,
                                                  color: Color(0xFFFFAB61),
                                                  size: 28,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 5, 0),
                                                child: Text(
                                                  comprarPassagemBilheteCompradoRecord
                                                      .quantCrianca
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final bilheteCompradoUpdateData =
                                                        {
                                                      ...createBilheteCompradoRecordData(
                                                        subtotalCrianca: functions.somarSubtotal(
                                                            comprarPassagemBilheteCompradoRecord
                                                                .subtotalCrianca,
                                                            comprarPassagemBilheteCompradoRecord
                                                                .precoCrianca),
                                                        totalPassagens: functions.somarSubtotal(
                                                            comprarPassagemBilheteCompradoRecord
                                                                .subtotalAdulto,
                                                            comprarPassagemBilheteCompradoRecord
                                                                .subtotalCrianca),
                                                      ),
                                                      'quant_crianca':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await comprarPassagemBilheteCompradoRecord
                                                        .reference
                                                        .update(
                                                            bilheteCompradoUpdateData);
                                                  },
                                                  child: Icon(
                                                    Icons.add_circle,
                                                    color: Color(0xFFEE8224),
                                                    size: 28,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            functions
                                                .somarSubtotal(
                                                    comprarPassagemBilheteCompradoRecord
                                                        .subtotalAdulto,
                                                    comprarPassagemBilheteCompradoRecord
                                                        .subtotalCrianca)
                                                .toString(),
                                            '00',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 22,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.transparent,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: Color(0x00CDCDCD),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Container(
                                              width: 180,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEBEBEB),
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: Image.network(
                                                    '',
                                                  ).image,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x22090F13),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: TextFormField(
                                                controller:
                                                    textFieldNomeCompletoRgController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Nome Completo',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              12, 12, 12, 12),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEBEBEB),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x22090F13),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  child: TextFormField(
                                                    controller:
                                                        textFieldNumeroRGController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'RG',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(12, 12,
                                                                  12, 12),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if ((textFieldNumeroRGController
                                                      .text !=
                                                  null) &&
                                              (textFieldNumeroRGController
                                                      .text !=
                                                  ''))
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 60,
                                              icon: Icon(
                                                Icons.touch_app_rounded,
                                                color: Color(0xFFEA7A1E),
                                                size: 35,
                                              ),
                                              onPressed: () async {
                                                final documentosPassageirosCreateData =
                                                    createDocumentosPassageirosRecordData(
                                                  nomeCompleto:
                                                      textFieldNomeCompletoRgController
                                                          .text,
                                                  numeroRg:
                                                      textFieldNumeroRGController
                                                          .text,
                                                  idBilhete:
                                                      comprarPassagemBilheteCompradoRecord
                                                          .idBilhete,
                                                  bilheteComprado:
                                                      comprarPassagemBilheteCompradoRecord
                                                          .reference,
                                                );
                                                await DocumentosPassageirosRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        documentosPassageirosCreateData);
                                                setState(() {
                                                  textFieldNumeroRGController
                                                      .clear();
                                                  textFieldNomeCompletoRgController
                                                      .clear();
                                                });
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: StreamBuilder<
                                                List<
                                                    DocumentosPassageirosRecord>>(
                                              stream:
                                                  queryDocumentosPassageirosRecord(
                                                queryBuilder: (documentosPassageirosRecord) =>
                                                    documentosPassageirosRecord
                                                        .where('id_bilhete',
                                                            isEqualTo:
                                                                comprarPassagemBilheteCompradoRecord
                                                                    .idBilhete),
                                                limit: 1,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<DocumentosPassageirosRecord>
                                                    listViewDocumentosPassageirosRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewDocumentosPassageirosRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewDocumentosPassageirosRecord =
                                                        listViewDocumentosPassageirosRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Container(
                                                        height: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            topLeft:
                                                                Radius.circular(
                                                                    16),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Icon(
                                                                Icons
                                                                    .assignment_ind,
                                                                color: Colors
                                                                    .black,
                                                                size: 24,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        listViewDocumentosPassageirosRecord
                                                                            .nomeCompleto,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                              fontSize: 13,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      listViewDocumentosPassageirosRecord
                                                                          .numeroRg,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          4,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await listViewDocumentosPassageirosRecord
                                                                          .reference
                                                                          .delete();
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Color(
                                                                          0xFF9E9E9E),
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'ACESSAR',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 55,
                                        color: Color(0xFFEE8224),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
