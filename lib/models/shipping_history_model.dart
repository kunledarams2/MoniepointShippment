
class ShippingHistory {
  final bool success;
  final String message;
  final List<ShippingDatum> data;

  ShippingHistory({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShippingHistory.fromJson(Map<String, dynamic> json) => ShippingHistory(
    success: json["success"],
    message: json["message"],
    data: List<ShippingDatum>.from(json["data"].map((x) => ShippingDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ShippingDatum {
  final int id;
  final String status;
  final String trackerCode;
  final String from;
  final String amount;
  final String date;

  ShippingDatum({
    required this.id,
    required this.status,
    required this.trackerCode,
    required this.from,
    required this.amount,
    required this.date,
  });

  factory ShippingDatum.fromJson(Map<String, dynamic> json) => ShippingDatum(
    id: json["id"],
    status: json["status"],
    trackerCode: json["trackerCode"],
    from: json["from"],
    amount: json["amount"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "trackerCode": trackerCode,
    "from": from,
    "amount": amount,
    "date": date,
  };
}