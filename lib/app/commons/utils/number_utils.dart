extension NumberFormat on double {
  String get formatNumber => 'R\$${toStringAsFixed(2).replaceAll('.', ',')}';

  String get formatNumberWithSpacing =>
      'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
}

extension Operator on (int, int) {
  (int, int) operator +((int, int) other) {
    var (int a1, int b1) = this;
    var (int a2, int b2) = other;
    return (a1 + a2, b1 + b2);
  }

  bool operator >(int other) {
    var (int a1, int b1) = this;
    return a1 > other && b1 > other;
  }

  bool operator <(int other) {
    var (int a1, int b1) = this;
    return a1 < other && b1 < other;
  }
}
