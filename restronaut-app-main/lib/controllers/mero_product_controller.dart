// You might not need this import, depending on your code
import 'package:get/get.dart';
import 'package:hyperce/models/model.dart';
import 'package:hyperce/models/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> hotDummyProducts = <ProductModel>[].obs;
  RxList<ProductModel> topSellingProducts = <ProductModel>[].obs;
  RxList<ProductModel> topRatedProducts = <ProductModel>[].obs;
  //Products

  void setProductList(ProductModel products) {
    productList.add(products);
    print("==========================");
    print("List of products are : ");
    productList.forEach((product) => print(product.name));
    print("==========================");
  }

  void categorizeAndPrintProducts() {
    // Clear the existing category lists
    // hotDummyProducts.clear();
    // topSellingProducts.clear();
    // topRatedProducts.clear();

    // Iterate through productList and categorize
    for (int i = 0; i < productList.length; i++) {
      ProductModel product = productList[i];

      if (i < 3) {
        hotDummyProducts.add(product);
      } else if (i < 6) {
        topSellingProducts.add(product);
      } else if (i < 9) {
        topRatedProducts.add(product);
      }
    }
    print(productList);
    // Print each category
    print('Hot Dummy Products:');
    hotDummyProducts.forEach((product) => print(product));

    print('Top Selling Products:');
    topSellingProducts.forEach((product) => print(product));

    print('Top Rated Products:');
    topRatedProducts.forEach((product) => print(product));
  }
}
