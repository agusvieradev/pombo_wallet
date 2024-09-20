import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class AccountRepository {
  AccountRepository({
    required this.firestore,
  });
  final FirebaseFirestore firestore;

  Future<void> createAccounts(
    String userId,
  ) async {
    try {
      final CollectionReference<Map<String, dynamic>> accountsCollection =
          FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('accounts');

      String accountIdUsd = accountsCollection.doc().id;
      await accountsCollection.doc(accountIdUsd).set({
        'balance': 0.0,
        'cvu': '000000000001',
        'account_data': '102030405-123124',
        'currency': 'USD',
      });

      String accountIdEur = accountsCollection.doc().id;
      await accountsCollection.doc(accountIdEur).set({
        'balance': 0.0,
        'cvu': '000000000002',
        'account_data': '102030405-123125',
        'currency': 'EUR',
      });

      String accountIdArs = accountsCollection.doc().id;
      await accountsCollection.doc(accountIdArs).set({
        'balance': 0.0,
        'cvu': '000000000003',
        'account_data': '102030405-123126',
        'currency': 'ARS',
      });

      String accountIdBrl = accountsCollection.doc().id;
      await accountsCollection.doc(accountIdBrl).set({
        'balance': 0.0,
        'cvu': '000000000004',
        'account_data': '102030405-123127',
        'currency': 'BRL',
      });
    } catch (e) {
      log('Error al crear las cuentas: $e');
    }
  }

  Future<String> getAccessToken(String userId) async {
    final Uri url = Uri.parse('https://api.sumsub.com/resources/accessTokens');
    final Map<String, String> headers = {
      'Authorization': 'Bearer your_api_key', //! FALTA API KEY
      'X-App-Token': 'your_app_token', //! FALTA APP TOKEN
      'Content-Type': 'application/json',
    };
    final String body = jsonEncode({
      'userId': userId,
      'levelName': 'basic-kyc-level',
      'ttlInSecs': 600,
    });
    try {
      final Response response = await post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        return data['token'];
      } else {
        throw Exception('Failed to get access token: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching access token: $e');
    }
  }
}

final Provider<AccountRepository> accountRepositoryProvider =
    Provider<AccountRepository>(
  (ProviderRef<AccountRepository> ref) {
    final FirebaseFirestore firestore = ref.watch(firestoreProvider);
    return AccountRepository(firestore: firestore);
  },
);
