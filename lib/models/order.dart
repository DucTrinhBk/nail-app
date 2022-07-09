class Order{
  int technicianId;
  int serviceId;
  String technicianName;
  String serviceName;
  double price;
  int quantity;
  Order({
    this.technicianId = 0,
    this.serviceId = 0,
    this.serviceName = '',
    this.technicianName = '',
    this.price = 0,
    this.quantity = 1
  });
}