import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class CriarTokenMPCall {
  static Future<ApiCallResponse> call({
    String cardNumber = '2307447264320424',
    String cardholderName = 'TAINA E COSTA',
    String cardExpirationMonth = '10',
    String cardExpirationYear = '2028',
    String securityCode = '227',
    String identificationType = 'CPF',
    String identificationNumber = '03126068260',
  }) {
    final body = '''
{
  "card_number": "${cardNumber}",
  "cardholder": {
    "name": "${cardholderName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    }
  },
  "security_code": "${securityCode}",
  "expiration_month": "${cardExpirationMonth}",
  "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CriarTokenMP',
      apiUrl:
          'https://api.mercadopago.com/v1/card_tokens?public_key=APP_USR-39e70b93-5947-4105-88fd-4c0a65f49422&locale=pt-BR&js_version=2.0.0&referer=https://aicrus.com.br',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'APP_USR-2053976731045010-111723-2b21d2196d3fe71799a04480173cbae7-796235686',
      },
      params: {
        'cardNumber': cardNumber,
        'cardholderName': cardholderName,
        'cardExpirationMonth': cardExpirationMonth,
        'cardExpirationYear': cardExpirationYear,
        'securityCode': securityCode,
        'identificationType': identificationType,
        'identificationNumber': identificationNumber,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic publickey(dynamic response) => getJsonField(
        response,
        r'''$.public_key''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class CardPayMPCall {
  static Future<ApiCallResponse> call({
    double transactionAmount = 1,
    String token = '1f6dd8f87db603656570654ae310ef00',
    String firstName = 'Tainá',
    String lastName = 'Evangelista Da Costa',
    String email = 'tayevangelista8@gmail.com',
    String identificationType = 'CPF',
    String identificationNumber = '03126068260',
    String zipCode = '06233200',
    String streetName = 'Av. das Nações Unidas',
    String streetNumber = '3003',
    String neighborhood = 'Bonfim',
    String city = 'Osasco',
    String federalUnit = 'SP',
    String description = '',
  }) {
    final body = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${token}",
  "installments": 1,
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    },
    "address": {
      "zip_code": "${zipCode}",
      "street_name": "${streetName}",
      "street_number": "${streetNumber}",
      "neighborhood": "${neighborhood}",
      "city": "${city}",
      "federal_unit": "${federalUnit}"
    }
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CardPayMP',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-2053976731045010-111723-2b21d2196d3fe71799a04480173cbae7-796235686',
        'Content-Type': 'application/json',
      },
      params: {
        'transaction_amount': transactionAmount,
        'token': token,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'identification_type': identificationType,
        'identification_number': identificationNumber,
        'zip_code': zipCode,
        'street_name': streetName,
        'street_number': streetNumber,
        'neighborhood': neighborhood,
        'city': city,
        'federal_unit': federalUnit,
        'description': description,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
