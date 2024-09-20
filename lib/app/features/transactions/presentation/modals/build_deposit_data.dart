import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_information.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

Widget buildDepositData(
  String transactionCurrency,
  String transactionMethod,
) {
  if (transactionCurrency == 'dolar') {
    switch (transactionMethod) {
      case 'bank':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PomboText().pomboLgText(
              text: 'Dólar - Transferencia',
            ),
            PomboText().pomboMdText(
              text: 'Utilizá estos datos para ingrasar dinero a tu cuenta',
            ),
            PomboWhiteSpaces.hSpaceL,
            PomboWhiteSpaces.hSpaceL,
            Container(
              decoration: const BoxDecoration(
                color: PomboColors.pomboBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Column(
                children: [
                  AccountInformation(
                    prepend: 'Beneficiario',
                    append: 'Bridge Ventures Inc',
                  ),
                  AccountInformation(
                    prepend: 'N° de cuenta',
                    append: '213923852516',
                  ),
                  AccountInformation(
                    prepend: 'N° Ruta',
                    append: '101019644',
                  ),
                  AccountInformation(
                    prepend: 'Direccion del beneficiario',
                    append:
                        '21750 Hardy Oak Blvd, Ste 104 PMB 77950, San Antonio, TX 78258',
                  ),
                  AccountInformation(
                    prepend: 'Banco',
                    append: 'Lead Bank',
                  ),
                  AccountInformation(
                    prepend: 'Direccion del banco',
                    append: '1801 Main St, Kansas City, MO 64108',
                  ),
                ],
              ),
            ),
          ],
        );
      case 'payoneer':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PomboText().pomboLgText(
              text: 'Dólar - Payoneer',
            ),
            PomboText().pomboMdText(
              text: 'Utilizá estos datos para ingrasar dinero a tu cuenta',
            ),
            PomboWhiteSpaces.hSpaceL,
            PomboWhiteSpaces.hSpaceL,
            Container(
              decoration: const BoxDecoration(
                color: PomboColors.pomboBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Column(
                children: [
                  AccountInformation(
                    prepend: 'Beneficiario',
                    append: 'Juan Pérez',
                  ),
                  AccountInformation(
                    prepend: 'ID de Payoneer',
                    append: '1234567890',
                  ),
                  AccountInformation(
                    prepend: 'Código SWIFT/BIC',
                    append: 'PAYOUS33XXX',
                  ),
                ],
              ),
            )
          ],
        );
      case 'paypal':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PomboText().pomboLgText(
              text: 'Dólar - PayPal',
            ),
            PomboText().pomboMdText(
              text: 'Utilizá estos datos para ingrasar dinero a tu cuenta',
            ),
            PomboWhiteSpaces.hSpaceL,
            PomboWhiteSpaces.hSpaceL,
            Container(
              decoration: const BoxDecoration(
                color: PomboColors.pomboBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Column(
                children: [
                  AccountInformation(
                    prepend: 'Beneficiario',
                    append: 'Maria Garcia',
                  ),
                  AccountInformation(
                    prepend: 'Email de PayPal',
                    append: 'maria.garcia@example.com',
                  ),
                ],
              ),
            )
          ],
        );
      case 'wise':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PomboText().pomboLgText(
              text: 'Dólar - Wise',
            ),
            PomboText().pomboSmText(
              text:
                  'Utilizá estos datos para ingrasar dinero a tu cuenta en dólares',
            ),
            PomboWhiteSpaces.hSpaceL,
            PomboWhiteSpaces.hSpaceL,
            Container(
              decoration: const BoxDecoration(
                color: PomboColors.pomboBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Column(
                children: [
                  AccountInformation(
                    prepend: 'Beneficiario',
                    append: 'Maria Garcia',
                  ),
                  AccountInformation(
                    prepend: 'Email de Wise',
                    append: 'maria.garcia@example.com',
                  ),
                ],
              ),
            )
          ],
        );
      default:
        return Container();
    }
  }
  if (transactionCurrency == 'peso') {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PomboText().pomboLgText(
          text: 'Pesos - Transferencia',
        ),
        PomboText().pomboMdText(
          text: 'Utilizá estos datos para ingrasar dinero a tu cuenta',
        ),
        PomboWhiteSpaces.hSpaceL,
        PomboWhiteSpaces.hSpaceL,
        Container(
          decoration: const BoxDecoration(
            color: PomboColors.pomboBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Column(
            children: [
              AccountInformation(
                prepend: 'Titular de la cuenta',
                append: 'Juan Pérez',
              ),
              AccountInformation(
                prepend: 'CUIT',
                append: '20-12345678-9',
              ),
              AccountInformation(
                prepend: 'CBU',
                append: '0110123456789012345678',
              ),
              AccountInformation(
                prepend: 'Alias',
                append: 'juanperez.banco',
              ),
              AccountInformation(
                prepend: 'Banco',
                append: 'Banco de la Nación Argentina',
              ),
              AccountInformation(
                prepend: 'Número de cuenta',
                append: '123456789012345678',
              ),
            ],
          ),
        ),
      ],
    );
  }
  if (transactionCurrency == 'euro') {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PomboText().pomboLgText(
          text: 'Euros - Transferencia',
        ),
        PomboText().pomboMdText(
          text: 'Utilizá estos datos para ingrasar dinero a tu cuenta',
        ),
        PomboWhiteSpaces.hSpaceL,
        PomboWhiteSpaces.hSpaceL,
        Container(
          decoration: const BoxDecoration(
            color: PomboColors.pomboBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Column(
            children: [
              AccountInformation(
                prepend: 'Beneficiario',
                append: 'Juan Pérez',
              ),
              AccountInformation(
                prepend: 'Número de ruta',
                append: '101019644',
              ),
              AccountInformation(
                prepend: 'IBAN',
                append: 'ES9121000418450200051234',
              ),
              AccountInformation(
                prepend: 'Código SWIFT/BIC',
                append: 'CAIXESBBXXX',
              ),
              AccountInformation(
                prepend: 'Número de cuenta',
                append: '101019644',
              ),
              AccountInformation(
                prepend: 'Dirección del beneficiario',
                append:
                    '21750 Hardy Oak Blvd, Ste 104 PMB 77950, San Antonio, TX 78258',
              ),
              AccountInformation(
                prepend: 'Banco',
                append: 'CaixaBank',
              ),
              AccountInformation(
                prepend: 'Dirección del banco',
                append: 'Avenida Diagonal 621, Barcelona, 08028, España',
              ),
            ],
          ),
        ),
      ],
    );
  }
  if (transactionCurrency == 'real') {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PomboText().pomboLgText(
          text: 'Reales - Pix',
        ),
        PomboText().pomboMdText(
          text: 'Utilizá estos datos para ingrasar dinero a tu cuenta',
        ),
        PomboWhiteSpaces.hSpaceL,
        PomboWhiteSpaces.hSpaceL,
        Container(
          decoration: const BoxDecoration(
            color: PomboColors.pomboBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Column(
            children: [
              AccountInformation(
                prepend: 'Clave Pix',
                append: 'juanperez@gmail.com',
              ),
              AccountInformation(
                prepend: 'Nombre del titular de la cuenta',
                append: 'Juan Pérez',
              ),
              AccountInformation(
                prepend: 'Banco',
                append: 'Banco do Brasil',
              ),
            ],
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}
