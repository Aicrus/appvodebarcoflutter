import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../data_viagem/data_viagem_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BuscarPassagemWidget extends StatefulWidget {
  const BuscarPassagemWidget({Key key}) : super(key: key);

  @override
  _BuscarPassagemWidgetState createState() => _BuscarPassagemWidgetState();
}

class _BuscarPassagemWidgetState extends State<BuscarPassagemWidget> {
  String dropDownValue1;
  String dropDownValue2;
  TextEditingController textFieldORIGEMController1;
  TextEditingController textFieldORIGEMController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldORIGEMController1 = TextEditingController();
    textFieldORIGEMController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 390,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                            child: Image.asset(
                              'assets/images/f34a68d556885d350ffaf823102e6a6ae04c534d03de41cad710071bbebd633d.jpeg',
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 110, 15, 0),
                            child: Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 20),
                                            child: Container(
                                              width: double.infinity,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x34090F13),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textFieldORIGEMController1,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Origem',
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
                                                    prefixIcon: Icon(
                                                      Icons.directions_boat,
                                                      color: Color(0xFFEA7A1E),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0F1113),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x34090F13),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textFieldORIGEMController2,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Destino',
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
                                                    prefixIcon: Icon(
                                                      Icons.location_pin,
                                                      color: Color(0xFFEA7A1E),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0F1113),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 20, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 3, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF5F5F5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x34090F13),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 8, 0),
                                                        child:
                                                            FlutterFlowDropDown(
                                                          options: [
                                                            'Domingo',
                                                            'Segunda',
                                                            'Terça',
                                                            'Quarta',
                                                            'Quinta',
                                                            'Sexta',
                                                            'Sabádo',
                                                            'Small',
                                                            'Medium',
                                                            'Large'
                                                          ].toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  dropDownValue1 =
                                                                      val),
                                                          width: 130,
                                                          height: 40,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          hintText: 'Dia',
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_drop_down_rounded,
                                                            color: Colors.black,
                                                            size: 15,
                                                          ),
                                                          fillColor:
                                                              Color(0xFFF5F5F5),
                                                          elevation: 2,
                                                          borderColor:
                                                              Color(0x00F1F4F8),
                                                          borderWidth: 2,
                                                          borderRadius: 22,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(24,
                                                                      4, 8, 4),
                                                          hidesUnderline: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3, 0, 0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF5F5F5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x34090F13),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 8, 0),
                                                        child:
                                                            FlutterFlowDropDown(
                                                          options: [
                                                            'Barco',
                                                            'Lancha',
                                                            'Small',
                                                            'Medium',
                                                            'Large'
                                                          ].toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  dropDownValue2 =
                                                                      val),
                                                          width: 130,
                                                          height: 40,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          hintText: 'Tipo',
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_drop_down_rounded,
                                                            color: Colors.black,
                                                            size: 15,
                                                          ),
                                                          fillColor:
                                                              Color(0xFFF5F5F5),
                                                          elevation: 2,
                                                          borderColor:
                                                              Color(0x00F1F4F8),
                                                          borderWidth: 2,
                                                          borderRadius: 22,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(24,
                                                                      4, 8, 4),
                                                          hidesUnderline: true,
                                                        ),
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: StreamBuilder<List<BilhetePassagemRecord>>(
                  stream: queryBilhetePassagemRecord(),
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
                    List<BilhetePassagemRecord>
                        columnBilhetePassagemRecordList = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                            columnBilhetePassagemRecordList.length,
                            (columnIndex) {
                          final columnBilhetePassagemRecord =
                              columnBilhetePassagemRecordList[columnIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: StreamBuilder<List<EmbarcacoesRecord>>(
                              stream: queryEmbarcacoesRecord(
                                queryBuilder: (embarcacoesRecord) =>
                                    embarcacoesRecord.where('id_embarcacao',
                                        isEqualTo: columnBilhetePassagemRecord
                                            .idEmbarcacao),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                }
                                List<EmbarcacoesRecord>
                                    containerEmbarcacoesRecordList =
                                    snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final containerEmbarcacoesRecord =
                                    containerEmbarcacoesRecordList.isNotEmpty
                                        ? containerEmbarcacoesRecordList.first
                                        : null;
                                return InkWell(
                                  onTap: () async {
                                    final usersUpdateData =
                                        createUsersRecordData(
                                      ultimoAcessoApp: getCurrentTimestamp,
                                    );
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child: DataViagemWidget(
                                          infobilhete:
                                              columnBilhetePassagemRecord
                                                  .reference,
                                          infoembarcacao:
                                              containerEmbarcacoesRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 340,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15,
                                          color: Color(0x21000000),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                        width: 1,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14, 14, 14, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  columnBilhetePassagemRecord
                                                      .cidadeOrigem,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFAD5111),
                                                        fontSize: 12,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                '---  ⚓  ---',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFC9C9C9),
                                                          fontSize: 14,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  columnBilhetePassagemRecord
                                                      .cidadeDestino,
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFA1A71B),
                                                        fontSize: 12,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14, 40, 14, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  columnBilhetePassagemRecord
                                                      .horaIda,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Duração\n12hs',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: Text(
                                                  columnBilhetePassagemRecord
                                                      .horaChegada,
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 80, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '-------------------------------------------------------',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFC3C3C3),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 108, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        containerEmbarcacoesRecord
                                                            .imagem,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Text(
                                                    containerEmbarcacoesRecord
                                                        .nome,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 10, 0),
                                                child: Text(
                                                  formatNumber(
                                                    columnBilhetePassagemRecord
                                                        .precoAdulto,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: 'R\$00,00',
                                                    locale: '',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
