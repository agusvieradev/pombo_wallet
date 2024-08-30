class Transaction {
  const Transaction({
    required this.amount,
    required this.description,
    required this.type,
    required this.paymentMethod,
    required this.currency,
    required this.date,
  });
  final double amount;
  final String description;
  final double type;
  final String paymentMethod;
  final String currency;
  final String date;
}
