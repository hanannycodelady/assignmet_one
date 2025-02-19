class Rating {
  final double value;

  Rating({required this.value});

  Map<String, dynamic> toJson() {
    return {"value": value};
  }
}
