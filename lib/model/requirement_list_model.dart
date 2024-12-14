class Requirement {
  final int id;
  final String year;
  final String status;
  final String brand;
  final String model;
  final String variant;
  final String transmission;
  final String fuelType;
  final String color;

  Requirement({
    required this.id,
    required this.year,
    required this.status,
    required this.brand,
    required this.model,
    required this.variant,
    required this.transmission,
    required this.fuelType,
    required this.color,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) {
    return Requirement(
      id: json['id'],
      year: json['year'] ?? '',
      status: json['status'] ?? '',
      brand: json['brand']['name'] ?? '',
      model: json['vehicle_model']['name'] ?? '',
      variant: json['vehicle_variant']['name'] ?? '',
      transmission: json['transmission']['name'] ?? '',
      fuelType: json['fuel_type']['name'] ?? '',
      color: json['vehicle_color']['name'] ?? '',
    );
  }
}
