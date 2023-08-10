class data{
  final String images;
  final String title;
  final String subtitle;
  final double price;

  const data({
    required this.images,
    required this.title,
    required this.subtitle,
    required this .price
  });
  static const List<data> datas = [
    data(images: "assets/images/Zephyrus-Duo11.png", 
    title: "Zephyrus Duo", 
    subtitle: "Asus Designing Laptop", 
    price: 4399),
    data(images: "assets/images/ASUS ROG STRIX SCAR 18 G834JY-N6037W.png", 
    title: "ROG STRIX SCAR 18", 
    subtitle: "Asus Gaming Laptop", 
    price: 3699),
    data(images: "assets/images/ROG STRIX G18.png", 
    title: "ROG STRIX G18", 
    subtitle: "Asus Gaming Laptop", 
    price: 2199),
    data(images: "assets/images/MACBOOK PRO 14.png", 
    title: "MACBOOK PRO 14", 
    subtitle: "Apple Chip M1 PRO", 
    price: 2239),
    data(images: "assets/images/MACBOOK PRO 14 22.png", 
    title: "MACBOOK PRO 16", 
    subtitle: "Apple Chip M1 Max", 
    price: 3229),
    data(images: "assets/images/MACBOOK AIR 15 33.png", 
    title: "MACBOOK AIR 15", 
    subtitle: "Apple Chip M2", 
    price: 1899),
    data(images: "assets/images/MSI TITAN GT77 HX 13VI.png", 
    title: "TITAN GT77 HX 13VI", 
    subtitle: "MSI Gaming Laptop", 
    price: 5699),
    data(images: "assets/images/MSI CYBORG 15 11.png", 
    title: "CYBORG 15", 
    subtitle: "MSI Gaming Laptop", 
    price: 769),
  ];
}