class MoneyFormat {
  static String format(double value) {
    //quiero que me regreses el sig formato $1,000.00
    return '\$${value.toStringAsFixed(2)}';
  }
}
