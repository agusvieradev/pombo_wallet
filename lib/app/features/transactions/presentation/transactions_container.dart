import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/transactions/data/transaction_repository.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class TransactionContainer extends ConsumerWidget {
  const TransactionContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboContainer(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: PomboColors.pomboBlue,
              ),
            );
          }
          final User? user = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PomboText().pomboLgText(
                text: 'Tus movimientos',
                isBold: true,
              ),
              PomboWhiteSpaces.hSpaceM,
              StreamBuilder(
                stream: ref
                    .watch(transactionRepositoryProvider)
                    .getTransactionsStream(user!.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: PomboColors.pomboBlue,
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return PomboText().pomboSmText(
                      text:
                          'Todavia no tenés ningun movimiento, apretá el botón de ingresar para generar el primero',
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var transaction = snapshot.data!.docs[index].data();
                      return ListTile(
                        title: Text('Transacción ${transaction['id']}'),
                        subtitle: Text('Monto: ${transaction['amount']}'),
                      );
                    },
                  );
                },
              ),
 
            ],
          );
        },
      ),
    );
  }
}
