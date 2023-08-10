class sale{
  final String images;
  final String title;
  final String subtitle;
  final double price;
  final String Discount;

  const sale({
    required this.images,
    required this.title,
    required this.subtitle,
    required this .price,
    required this.Discount
  });
  static const List<sale> sales = [
    sale(images: "assets/productsales/potserasus.png", 
    title: "On everything today", 
    subtitle: "with code: FSCREATION", 
    price: 2199,
    Discount:"20% off"),
    sale(images: "assets/productsales/msiposter.png", 
    title: "On everything today", 
    subtitle: "with code: FSCREATION", 
    price: 3699,
    Discount:"25% off"),
    sale(images: "assets/productsales/aorusposter.png", 
    title: "On everything today",
    subtitle: "with code: FSCREATION", 
    price: 4399,
    Discount:"30% off"
    ),
  ];
}