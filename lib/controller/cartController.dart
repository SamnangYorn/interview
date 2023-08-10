import 'package:get/get.dart';
import 'package:interview/data/data.dart';

class CartController extends GetxController {
  final _products = {}.obs;
  final double Tax =0.2;
  void addProduct(data product){
    if(_products.containsKey(product)){
      _products[product] += 1;
    }else{
      _products[product] = 1;
    }
  }
  RxList<data>isliked = <data>[].obs;

  void addfavorite (data product){
    if(isliked.contains(product)){
      isliked.remove(product);
    }else{
      isliked.add(product);
      print(isliked);
    }
  }
  void deletefavorite (data product){
    isliked.remove(product);
    // if(isliked.contains(product)){
      
    // }
  }

  get products => _products;

  void removeallproduct(data product) {
    if(_products.containsKey(product)){
      _products.remove(product);
    }
  }
  
bool liked (data product){
    return isliked.contains(product);
  }

  void removeProduct(data product) {
    if(_products.containsKey(product) && _products[product] == 1){
      _products.removeWhere((key, value) => key == product);
    }else{
      _products[product] -= 1;
    }
  }
    get productSubtotal => _products.entries.isNotEmpty?_products.entries
      .map((product) => (product.key.price * product.value) - (product.key.price * Tax))
      .toList()
      .reduce((value, element) => value + element).toStringAsFixed(2):0.0;

  get tax => _products.entries.isNotEmpty?_products.entries
      .map((product) => (product.key.price * product.value) * Tax)
      .toList().reduce((value, element) => value + element).toStringAsFixed(2):0.0;


  get total => _products.entries.isNotEmpty?_products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element).toStringAsFixed(2):0.0;
}