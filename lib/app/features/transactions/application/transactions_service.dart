import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart' as jsemail;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/application/account_service.dart';
import 'package:pombo_wallet/app/features/account/domain/account.dart';
import 'package:pombo_wallet/app/features/authentication/application/auth_service.dart';
import 'package:pombo_wallet/app/features/transactions/data/transaction_repository.dart';
import 'package:pombo_wallet/app/features/user/domain/user_state.dart';

class TransactionService extends StateNotifier<Map<String, dynamic>> {
  TransactionService({
    required this.transactionRepository,
    required this.user,
    required this.accountList,
  }) : super({
          'amount': '',
          'type': '',
          'payment_method': '',
          'currency': '',
          'accountId': '',
          'accountToData': {},
          'method': ''
        });

  final UserState user;
  late Map<String, dynamic> transactionData;
  final TransactionRepository transactionRepository;
  final List<Account> accountList;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController amountController = TextEditingController();
  final TextEditingController cvuOrAliasController = TextEditingController();
  final GlobalKey<FormState> formTransactionKey = GlobalKey<FormState>();

  addType(String type) {
    transactionData = state;
    transactionData['type'] = type;
    state = transactionData;
  }

  addPaymentMethod(String paymentMethod) {
    transactionData = state;
    transactionData['payment_method'] = paymentMethod;
    state = transactionData;
  }

  addCurrency(String currency) {
    transactionData = state;
    transactionData['currency'] = currency;
    state = transactionData;
  }

  addAmount(String amount) {
    transactionData = state;
    transactionData['amount'] = amount;
    state = transactionData;
  }

  addAccountId(String accountId) {
    transactionData = state;
    transactionData['accountId'] = accountId;
    state = transactionData;
  }

  addAccountData(String accountToData) {
    transactionData = state;
    transactionData['accountToData'] = accountToData;
    state = transactionData;
  }

  cleanTransactionData() {
    state = {
      'amount': '',
      'type': '',
      'payment_method': '',
      'currency': '',
      'accountId': '',
      'accountToData': {},
      'method': ''
    };
  }

  Future createWithdraw(double amount, Map accountToData) async {
    print(accountList[0]);
    await transactionRepository.createTransaction(
      userId: user.user!.uid,
      accountId: accountList[1].accountId,
      amount: amount,
      description: '',
      currency: 'ARS',
      method: 'bank',
      type: 'withdraw',
      accountToData: {'alias': 'trigo.avena.centeno'},
    );
  }

  Future createTestDeposit() async {
    print(accountList[0]);

    await transactionRepository.createTransaction(
      userId: user.user!.uid,
      accountId: accountList[1].accountId,
      amount: 100.0,
      description: '',
      currency: 'ARS',
      method: 'bank',
      type: 'deposit',
      accountToData: {'alias': 'trigo.avena.centeno'},
    );
  }

  Future createTestWithdraw() async {
    print(accountList[0]);

    await transactionRepository.createTransaction(
      userId: user.user!.uid,
      accountId: accountList[1].accountId,
      amount: 100.0,
      description: '',
      currency: 'ARS',
      method: 'bank',
      type: 'withdraw',
      accountToData: {'alias': 'trigo.avena.centeno'},
    );
  }

  void clearControllers() {
    // emailController.clear();
    // amountController.clear();
  }



  Future<void> sendEmail(
    String email,
    String amount,
    Map<String, dynamic> paymentInformation,
  ) async {
    final String? pvk = dotenv.env['EMAILJS_PRIVATE_KEY'];
    final String? pbk = dotenv.env['EMAILJS_PUBLIC_KEY'];
    final String? serviceId = dotenv.env['EMAILJS_SERVICE_ID'];
    final String? templateId = dotenv.env['EMAILJS_TEMPLATE_A_TEST'];

    print('pvk $pvk , pbk $pbk');
    final String bodyMessage =
        'Monto: \$$amount\nMoneda:${paymentInformation['Currency']}\n\nDatos de pago:\nCVU:000000000\nAlias:trigo.avena.centeno\nBanco:ICBC BANK';
    try {
      await jsemail.send(
        serviceId!,
        templateId!,
        {
          'from_name': 'Company SRL',
          'to_email': email,
          'message': bodyMessage,
        },
        jsemail.Options(
            publicKey: pbk,
            privateKey: pvk,
            limitRate: const jsemail.LimitRate(
              id: 'app',
              throttle: 10000,
            )),
      );
    } catch (error) {
      if (error is jsemail.EmailJSResponseStatus) {
        print('ERROR... $error');
      }
      print(error.toString());
      throw Exception(error);
    }
  }
}

final StateNotifierProvider<TransactionService, Map<String, dynamic>>
    transactionServiceProvider =
    StateNotifierProvider<TransactionService, Map<String, dynamic>>(
  (StateNotifierProviderRef<TransactionService, Map<String, dynamic>> ref) {
    final TransactionRepository transactionRepository = ref.watch(
      transactionRepositoryProvider,
    );
    final UserState userState = ref.watch(authServiceProvider);
    final List<Account> accountList = ref.watch(accountServiceProvider);
    return TransactionService(
        transactionRepository: transactionRepository,
        user: userState,
        accountList: accountList);
  },
);
