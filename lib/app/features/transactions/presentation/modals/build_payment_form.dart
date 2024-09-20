import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/transactions/application/transactions_service.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_modal.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_primary_button.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/utils/utils.dart';

Widget builPaymentForm(
  String transactionCurrency,
  String transactionMethod,
  WidgetRef ref,
  BuildContext context,
) {
  final TransactionService transactionService = ref.read(
    transactionServiceProvider.notifier,
  );
  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  if (transactionCurrency == 'dolar') {
    switch (transactionMethod) {
      case 'bank':
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PomboText().pomboLgText(
              text: 'Dólar - Transferencia',
            ),
            PomboText().pomboMdText(
              text: 'Ingresá el correo y el monto para generar un mail de pago',
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: transactionService.formTransactionKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Monto a cobrar',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.payment,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: PomboColors.pomboBlue,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Email del pagador',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.email,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceL,
                    SizedBox(
                      width: double.infinity,
                      child: PomboPrimaryButton(
                        buttonText: 'Enviar',
                        buttonAction: () async {
                          try {
                            await transactionService.sendEmail(
                              emailController.text,
                              amountController.text,
                              {},
                            );
                            popMultipleTimes(context, 3);
                            if (context.mounted) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return PomboModal(
                                    body: Center(
                                      child: Column(
                                        children: [
                                          const Icon(
                                            PomboIcons.succcess,
                                            color: PomboColors.pomboSuccess,
                                            size: 80,
                                          ),
                                          PomboWhiteSpaces.hSpaceL,
                                          PomboText().pomboLgText(
                                            text:
                                                'Mail de pago enviado exitosamente',
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierColor: PomboColors.pomboTrans,
                                builder: (BuildContext context) {
                                  return PomboModal(
                                    body: Center(
                                      child: Column(
                                        children: [
                                          const Icon(
                                            PomboIcons.succcess,
                                            color: PomboColors.pomboSuccess,
                                            size: 80,
                                          ),
                                          PomboWhiteSpaces.hSpaceL,
                                          PomboText().pomboLgText(
                                            text:
                                                'Mail de pago enviado exitosamente',
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
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
              text: 'Ingresá el correo y el monto para generar un mail de pago',
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: transactionService.formTransactionKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Monto a cobrar',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.payment,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: PomboColors.pomboBlue,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Email del pagador',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.email,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    SizedBox(
                      width: double.infinity,
                      child: PomboPrimaryButton(
                        buttonText: 'Enviar',
                        buttonAction: () {},
                      ),
                    ),
                  ],
                ),
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
              text: 'Ingresá el correo y el monto para generar un mail de pago',
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: transactionService.formTransactionKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Monto a cobrar',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.payment,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: PomboColors.pomboBlue,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Email del pagador',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.email,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    SizedBox(
                      width: double.infinity,
                      child: PomboPrimaryButton(
                        buttonText: 'Enviar',
                        buttonAction: () {},
                      ),
                    ),
                  ],
                ),
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
            PomboText().pomboMdText(
              text: 'Ingresá el correo y el monto para generar un mail de pago',
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
              child: Column(
                children: [
                  Form(
                    key: transactionService.formTransactionKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: amountController,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: PomboText().pomboSmText(
                              text: 'Monto a cobrar',
                            ),
                            prefixIcon: const Icon(
                              PomboIcons.payment,
                              color: PomboColors.pomboBlue,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || int.parse(value) <= 0) {
                              return 'Por favor ingresá un monto valido';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Ingresa un email válido';
                            }
                            return null;
                          },
                        ),
                        PomboWhiteSpaces.hSpaceM,
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: PomboColors.pomboBlue,
                            fontSize: 22,
                          ),
                          decoration: InputDecoration(
                            label: PomboText().pomboSmText(
                              text: 'Email del pagador',
                            ),
                            prefixIcon: const Icon(
                              PomboIcons.email,
                              color: PomboColors.pomboBlue,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || int.parse(value) <= 0) {
                              return 'Por favor ingresá un monto valido';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Ingresa un email válido';
                            }
                            return null;
                          },
                        ),
                        PomboWhiteSpaces.hSpaceM,
                        SizedBox(
                          width: double.infinity,
                          child: PomboPrimaryButton(
                            buttonText: 'Enviar',
                            buttonAction: () {},
                          ),
                        ),
                      ],
                    ),
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
          text: 'Ingresá el correo y el monto para generar un mail de pago',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: transactionService.formTransactionKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Monto a cobrar',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.payment,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: PomboColors.pomboBlue,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Email del pagador',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.email,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    SizedBox(
                      width: double.infinity,
                      child: PomboPrimaryButton(
                        buttonText: 'Enviar',
                        buttonAction: () {},
                      ),
                    ),
                  ],
                ),
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
          text: 'Ingresá el correo y el monto para generar un mail de pago',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: transactionService.formTransactionKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Monto a cobrar',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.payment,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: PomboColors.pomboBlue,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Email del pagador',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.email,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    SizedBox(
                      width: double.infinity,
                      child: PomboPrimaryButton(
                        buttonText: 'Enviar',
                        buttonAction: () {},
                      ),
                    ),
                  ],
                ),
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
          text: 'Ingresá el correo y el monto para generar un mail de pago',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: transactionService.formTransactionKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Monto a cobrar',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.payment,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: PomboColors.pomboBlue,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Email del pagador',
                        ),
                        prefixIcon: const Icon(
                          PomboIcons.email,
                          color: PomboColors.pomboBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || int.parse(value) <= 0) {
                          return 'Por favor ingresá un monto valido';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    SizedBox(
                      width: double.infinity,
                      child: PomboPrimaryButton(
                        buttonText: 'Enviar',
                        buttonAction: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  } else {
    return const SizedBox();
  }
}
