import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/logoapplevo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'EscolhadeAcesso': (data) async => EscolhadeAcessoWidget(),
  'InicioSemLogin': (data) async => InicioSemLoginWidget(),
  'Estadia': (data) async => EstadiaWidget(),
  'Restaurantes': (data) async => RestaurantesWidget(),
  'Passeios': (data) async => PasseiosWidget(),
  'Mais': (data) async => NavBarPage(initialPage: 'MaisWidget'),
  'BuscarNavegacao': (data) async => BuscarNavegacaoWidget(),
  'BuscarPassagem': (data) async =>
      NavBarPage(initialPage: 'BuscarPassagemWidget'),
  'MinhasViagens': (data) async =>
      NavBarPage(initialPage: 'MinhasViagensWidget'),
  'BilheteEmAndamento': (data) async => BilheteEmAndamentoWidget(),
  'BilheteConcluido': (data) async => BilheteConcluidoWidget(),
  'ComprarPassagem': (data) async => ComprarPassagemWidget(
        bilheteinfo: getParameter(data, 'bilheteinfo'),
      ),
  'DataViagem': (data) async => DataViagemWidget(
        infobilhete: getParameter(data, 'infobilhete'),
        infoembarcacao: getParameter(data, 'infoembarcacao'),
      ),
  'CadastroSucesso': (data) async => CadastroSucessoWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
