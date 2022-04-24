import '../bilhete_concluido/bilhete_concluido_widget.dart';
import '../bilhete_em_andamento/bilhete_em_andamento_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MinhasViagensWidget extends StatefulWidget {
  const MinhasViagensWidget({Key key}) : super(key: key);

  @override
  _MinhasViagensWidgetState createState() => _MinhasViagensWidgetState();
}

class _MinhasViagensWidgetState extends State<MinhasViagensWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            '',
                          ).image,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Color(0x32000000),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Text(
                                  'Minhas viagens',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                ),
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
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Color(0xFFEA7A1E),
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                        indicatorColor: Color(0xFFCDCDCD),
                        tabs: [
                          Tab(
                            text: 'Próximas viagens',
                          ),
                          Tab(
                            text: 'Viagens passadas',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: Text(
                                    'Em andamento',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 20),
                                        child: Container(
                                          width: double.infinity,
                                          height: 184,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: Image.network(
                                                'https://cultura.am.gov.br/portal/wp-content/uploads/2019/02/MFD_6475.jpg',
                                              ).image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0x65090F13),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 16, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Manaus',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: Colors.white,
                                                          size: 24,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 4, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Saide de Porto Velho ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 4,
                                                                  16, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  reverseDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              0),
                                                                  child:
                                                                      BilheteEmAndamentoWidget(),
                                                                ),
                                                              );
                                                            },
                                                            text: 'Detalhes',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120,
                                                              height: 40,
                                                              color: Color(
                                                                  0xFF97BB2C),
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Lexend Deca',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                              ),
                                                              elevation: 3,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 8,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Text(
                                                                    '10:00am',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title3
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Quinta -Julho 22',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xB4FFFFFF),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: Text(
                                    'Concluídas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 20),
                                        child: Container(
                                          width: double.infinity,
                                          height: 184,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: Image.network(
                                                'data:image/jpeg;base64,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',
                                              ).image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0x65090F13),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 16, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Nova Olinda Do Norte',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: Colors.white,
                                                          size: 24,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 4, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Saide de Manaus',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 4,
                                                                  16, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  reverseDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              0),
                                                                  child:
                                                                      BilheteConcluidoWidget(),
                                                                ),
                                                              );
                                                            },
                                                            text: 'Detalhes',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120,
                                                              height: 40,
                                                              color: Color(
                                                                  0xFF97BB2C),
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Lexend Deca',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                              ),
                                                              elevation: 3,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 8,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Text(
                                                                    '10:00am',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title3
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Quinta -Julho 22',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xB4FFFFFF),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
    );
  }
}
