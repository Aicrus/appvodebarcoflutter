import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalLoginWidget extends StatefulWidget {
  const ModalLoginWidget({Key key}) : super(key: key);

  @override
  _ModalLoginWidgetState createState() => _ModalLoginWidgetState();
}

class _ModalLoginWidgetState extends State<ModalLoginWidget> {
  TextEditingController emailController;
  TextEditingController senhaController;
  bool senhaVisibility;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    senhaController = TextEditingController();
    senhaVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 1, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                  child: Text(
                    'Acessar',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 15),
            child: TextFormField(
              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'email de acesso',
                labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE0E3E7),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE0E3E7),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFFEE8224),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF0F1113),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
            child: TextFormField(
              controller: senhaController,
              obscureText: !senhaVisibility,
              decoration: InputDecoration(
                labelText: 'senha de acesso',
                labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE0E3E7),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE0E3E7),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                prefixIcon: Icon(
                  Icons.lock_rounded,
                  color: Color(0xFFEE8224),
                ),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () => senhaVisibility = !senhaVisibility,
                  ),
                  child: Icon(
                    senhaVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF0F1113),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final user = await signInWithEmail(
                  context,
                  emailController.text,
                  senhaController.text,
                );
                if (user == null) {
                  return;
                }

                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'Inicio'),
                  ),
                  (r) => false,
                );
              },
              text: 'ACESSAR',
              options: FFButtonOptions(
                width: 330,
                height: 55,
                color: Color(0xFFEE8224),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.lock_open,
                  color: Color(0xFFEE8224),
                  size: 25,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Esqueci minha senha',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF4B4B4B),
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'Mudar senha',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
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
  }
}
