import 'package:hyperce/api/graphql_config.dart';
import 'package:hyperce/controllers/collection_controller.dart';
import 'package:hyperce/controllers/product_varient_controller.dart';
import 'package:hyperce/controllers/username_controller.dart';
import 'package:hyperce/models/createcustomer.dart';
import 'package:hyperce/models/createcustomerreuslt.dart';
import 'package:hyperce/models/enums.dart';
import 'package:hyperce/models/model.dart';
import 'package:hyperce/models/refresh_customer_otp.dart';
import 'package:hyperce/screens/authentication/otp_screen.dart';
import 'package:hyperce/services/notification/notification_service.dart';
import 'package:hyperce/screens/widgets/our_flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import '../controllers/progress_controller.dart';
import 'db/db_helper.dart';

class GraphQLService {
  // static

//To get category list
  Future<List<CategoryModel>?> getcategory() async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    List<CategoryModel> categoryList = [];
    List<String> idLIst = [];
    List<String> nameLIst = [];
    List<String> slugLIst = [];
    print("Inside get category api");
    try {
      QueryResult result = await client.query(QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork, document: gql("""
query{
  collections{
    items{
      name,
      slug
      id,
      assets{
        source
      }
    }
  }
}
""")));
      if (result.hasException) {
        throw Exception(result.exception);
      }
      print(result.data!["collections"]["items"].length);
      result.data!["collections"]["items"].forEach((e) {
        print(e);
        idLIst.add(e["id"]);
        nameLIst.add(e["name"]);
        slugLIst.add(e["slug"]);
        CategoryModel categoryModel = CategoryModel.fromJson(e);
        categoryList.add(categoryModel);
      });
      Get.find<OurCollectionController>().collectionIDAdd(idLIst);
      Get.find<OurCollectionController>().collectionNameAdd(nameLIst);
      Get.find<OurCollectionController>().collectionSlugAdd(slugLIst);
      print(categoryList);
      print("====================");
      return categoryList;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<List<ProductModel>>?> fetchProducts() async {
    try {
      GraphQLConfig graphQLConfig = GraphQLConfig();
      GraphQLClient client = graphQLConfig.clientTOQuery();
      List<ProductModel> hotDummyProducts = [];
      List<ProductModel> topRatedProducts = [];
      List<ProductModel> topProducts = [];
      List<List<ProductModel>> allProducts = [
        hotDummyProducts,
        topRatedProducts,
        topProducts
      ];
      List<String> ids = [
        "130",
        "131",
        "132",
        "133",
        "134",
        "135",
        "136",
        "137",
        "138",
        "139"
      ];

      print("----------------------");
      print('Start the fetching');

      for (int i = 0; i < ids.length; i++) {
        QueryResult result = await client.query(QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
        query GetProduct(\$productid: ID!) {
          product(id: \$productid) {
            __typename
            id
            name
            description
            assets {
              __typename
              source
            }
            variants {
              __typename
              price
            }
            customFields {
              __typename
              reviewCount
            }
          }
        }
      """),
          variables: {
            'productid': ids[i],
          },
        ));

        if (result.hasException) {
          throw Exception(result.exception);
        }
        print("The result is ");
        print(result);

        Map<String, dynamic>? productData = result.data!['product'];

        if (productData != null) {
          String? id = productData['id']?.toString();
          String? name = productData['name']?.toString();
          String? description = productData['description']?.toString();
          Asset? preview =
              productData['assets'] != null && productData['assets'].isNotEmpty
                  ? Asset(source: productData['assets'][0]['source'])
                  : Asset(source: '');
          ProductVariantDetail? price = productData['variants'] != null &&
                  productData['variants'].isNotEmpty
              ? ProductVariantDetail(
                  price:
                      int.parse(productData['variants'][0]['price'].toString()))
              : ProductVariantDetail(price: 0);
          CustomFields? review = productData['customFields'] != null
              ? CustomFields(
                  reviewCount:
                      productData['customFields']['reviewCount'].toString())
              : CustomFields(reviewCount: "0");

          if (id != null && name != null) {
            ProductModel product = ProductModel(
              id: id,
              name: name,
              description: description ?? '',
              preview: preview,
              price: price,
              rating: review,
            );

            if (i < 3) {
              // The first three products are hot
              hotDummyProducts.add(product);
            } else if (i < 6) {
              // The next three products are top-rated
              topRatedProducts.add(product);
            } else {
              // The remaining products are top
              topProducts.add(product);
            }
          }
        }
      }

      print('--------------');
      print('End the fetching');
      print("=============Hot Dummy Products ===============");
      print(hotDummyProducts);
      print("=============Top Rated Products ===============");
      print(topRatedProducts);
      print("=============Top Products ===============");
      print(topProducts);

      return allProducts; // Or any other list as needed
    } catch (e) {
      print("Error during fetching ........");
      print(e.toString());
      return [];
    }
  }

  //To get products based on category
  Future<List<Map<dynamic, dynamic>>?> getcategorybasedproduct(
      int collectionID, String collectionSlug) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    List<CategoryModel> categoryList = [];
    print("Inside get category based product api");
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
query Query(\$collectionID: ID
\$collectionSlug:String
){
  search(
    input: { 
      collectionId: \$collectionID
  collectionSlug: \$collectionSlug
  }
  ) {
    items {
      slug
      productId
      productName
      productVariantName
      productAsset{
        id
        preview
      }
      description
      currencyCode
     productVariantAsset{
        preview
      }
      priceWithTax {
        ... on SinglePrice {
          value
        }
      }
    productVariantId
      inStock
    }
  }
}
"""),
          variables: {
            "collectionId": collectionID,
            "collectionSlug": collectionSlug,
          },
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }
      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      List<String> productNameList = [];
      List<Map<dynamic, dynamic>> mainList = [];
      // );
      if (result.data!["search"]["items"] != null) {
        result.data!["search"]["items"].forEach((e) {
          // print(e);
          if (productNameList.contains(e["productName"])) {
            // print("+++++++++++++++++++++");

            mainList.forEach((element) {
              if (element["productName"] == e["productName"]) {
                // print("low price current: ${element["lowPrice"]}");
                // print(
                //     "low price current next: ${int.parse(e["priceWithTax"]["value"].toString())}");
                // print("high price current: ${element["highPrice"]}");
                // print(
                //     "high price current next: ${int.parse(e["priceWithTax"]["value"].toString())}");
                element["lowPrice"] = element["lowPrice"] <
                        int.parse(e["priceWithTax"]["value"].toString())
                    ? element["lowPrice"]
                    : int.parse(e["priceWithTax"]["value"].toString());
                //  "productAssets": [ e["productAsset"]["preview"]],

                element["highPrice"] = element["highPrice"] >
                        int.parse(e["priceWithTax"]["value"].toString())
                    ? element["highPrice"]
                    : int.parse(e["priceWithTax"]["value"].toString());
              }
            });

            mainList.forEach((element) {
              if (element["productName"] == e["productName"]) {
                element["productAssets"].add(
                  e["productVariantAsset"] != null
                      ? e["productVariantAsset"]["preview"]
                      : "",
                );
                element["productVariantDetail"].add(
                  {
                    "productVariantName": e["productVariantName"],
                    "slug": e["slug"],
                    "productId": e["productId"],
                    "productName": e["productName"],
                    "productVarientAsset": e["productVariantAsset"] != null
                        ? e["productVariantAsset"]["preview"]
                        : "",
                    "description": e["description"],
                    "currencyCode": e["currencyCode"],
                    "priceWithTax": e["priceWithTax"]["value"],
                    "productVariantId": e["productVariantId"],
                    "inStock": e["inStock"],
                  },
                );
              }
            });
          } else {
            productNameList.add(e["productName"]);
            mainList.add({
              "productName": e["productName"],
              "productId": e["productId"],
              "productAssets": [e["productAsset"]["preview"]],
              "lowPrice": int.parse(e["priceWithTax"]["value"].toString()),
              "highPrice": int.parse(e["priceWithTax"]["value"].toString()),
              "productNameList": [e["productName"]],
              "productVariantDetail": []
            });
            mainList.forEach((element) {
              if (element["productName"] == e["productName"]) {
                element["productAssets"].add(e["productVariantAsset"] != null
                    ? e["productVariantAsset"]["preview"]
                    : "");
                element["productVariantDetail"].add(
                  {
                    "productVariantName": e["productVariantName"],
                    "slug": e["slug"],
                    "productId": e["productId"],
                    "productName": e["productName"],
                    "productVarientAsset": e["productVariantAsset"] != null
                        ? e["productVariantAsset"]["preview"]
                        : "",
                    "description": e["description"],
                    "currencyCode": e["currencyCode"],
                    "priceWithTax": e["priceWithTax"]["value"],
                    "productVariantId": e["productVariantId"],
                    "inStock": e["inStock"],
                  },
                );
              }
            });
          }
        });
      }
      print("===============================");

      return mainList;
    } catch (e) {
      print("object");
      print(e);
    }
    return null;
  }

//to get images of products
  Future<List<String>?> getproductImages(
      int productId, String productSlug) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    List<String> productImages = [];
    List<String> productName = [];
    List<String> productVarientId = [];
    print("Inside product images");
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
query Query(\$productID: ID
\$productSlug:String
){

    product(
   id: \$productID
  slug: \$productSlug
  )
      
   {
    assets{
      preview
    }
    variants{
      id
      name
      
    }
  }
}
"""),
          variables: {
            "productID": productId,
            "productSlug": productSlug,
          },
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }
      print(result.data);
      result.data!["product"]["assets"].forEach((e) {
        productImages.add(e["preview"]);
        print(e["preview"]);
      });

      result.data!["product"]["variants"].forEach((e) {
        productName.add(e["name"]);
        productVarientId.add(e["id"]);
        // print(e["preview"]);
        print(productName);
        print(productVarientId);
        Get.find<ProductVarientController>()
            .productVairentIDList(productVarientId);
        Get.find<ProductVarientController>()
            .productVairentNameList(productName);
      });

      return productImages;
    } catch (e) {
      print(e);
    }
    return null;
  }

  //To get products based on name
  Future<List<Map<dynamic, dynamic>>?> getNamebasedproduct(
      String productName) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    List<CategoryModel> categoryList = [];
    print("Inside get category based product api");
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
query Query(
\$productName:String
){
  search(
    input: { 
     
  term: \$productName
  }
  ) {
    items {
      slug
      productId
      productName
      productVariantName
      productAsset{
        id
        preview
      }
      description
      currencyCode
     productVariantAsset{
        preview
      }
      priceWithTax {
        ... on SinglePrice {
          value
        }
      }
    productVariantId
      inStock
    }
  }
}
"""),
          variables: {
            "productName": productName,
          },
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      List<String> productNameList = [];
      List<Map<dynamic, dynamic>> mainList = [];
      // );
      if (result.data!["search"]["items"] != null) {
        result.data!["search"]["items"].forEach((e) {
          // print(e);
          if (productNameList.contains(e["productName"])) {
            // print("+++++++++++++++++++++");

            mainList.forEach((element) {
              if (element["productName"] == e["productName"]) {
                print("low price current: ${element["lowPrice"]}");
                print(
                    "low price current next: ${double.parse(e["priceWithTax"]["value"].toString())}");
                print("high price current: ${element["highPrice"]}");
                print(
                    "high price current next: ${double.parse(e["priceWithTax"]["value"].toString())}");
                element["lowPrice"] = element["lowPrice"] <
                        double.parse(e["priceWithTax"]["value"].toString())
                    ? element["lowPrice"]
                    : double.parse(e["priceWithTax"]["value"].toString());
                //  "productAssets": [ e["productAsset"]["preview"]],

                element["highPrice"] = element["highPrice"] >
                        double.parse(e["priceWithTax"]["value"].toString())
                    ? element["highPrice"]
                    : double.parse(e["priceWithTax"]["value"].toString());
              }
            });

            mainList.forEach((element) {
              if (element["productName"] == e["productName"]) {
                element["productAssets"].add(
                  e["productVariantAsset"] != null
                      ? e["productVariantAsset"]["preview"]
                      : "",
                );
                element["productVariantDetail"].add(
                  {
                    "productVariantName": e["productVariantName"],
                    "slug": e["slug"],
                    "productId": e["productId"],
                    "productName": e["productName"],
                    "productVarientAsset": e["productVariantAsset"] != null
                        ? e["productVariantAsset"]["preview"]
                        : "",
                    "description": e["description"],
                    "currencyCode": e["currencyCode"],
                    "priceWithTax": e["priceWithTax"]["value"],
                    "productVariantId": e["productVariantId"],
                    "inStock": e["inStock"],
                  },
                );
              }
            });
          } else {
            productNameList.add(e["productName"]);
            mainList.add({
              "productName": e["productName"],
              "productAssets": [e["productAsset"]["preview"]],
              "lowPrice": double.parse(e["priceWithTax"]["value"].toString()),
              "highPrice": double.parse(e["priceWithTax"]["value"].toString()),
              "productNameList": [e["productName"]],
              "productVariantDetail": []
            });
            mainList.forEach((element) {
              if (element["productName"] == e["productName"]) {
                element["productAssets"].add(e["productVariantAsset"] != null
                    ? e["productVariantAsset"]["preview"]
                    : "");
                element["productVariantDetail"].add(
                  {
                    "productVariantName": e["productVariantName"],
                    "slug": e["slug"],
                    "productId": e["productId"],
                    "productName": e["productName"],
                    "productVarientAsset": e["productVariantAsset"] != null
                        ? e["productVariantAsset"]["preview"]
                        : "",
                    "description": e["description"],
                    "currencyCode": e["currencyCode"],
                    "priceWithTax": e["priceWithTax"]["value"],
                    "productVariantId": e["productVariantId"],
                    "inStock": e["inStock"],
                  },
                );
              }
            });
          }
        });
      }
      print("===============================");

      return mainList;
    } catch (e) {
      print("object");
      print(e);
    }
    return null;
  }

  //user login

  //To login
  userlogin(String username, String password, BuildContext context) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    final userController = Get.put(UserController());

    print("Inside user login api");
    Get.find<ProgressController>().changeValue(true);
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
mutation QueryLogin(
  \$username: String!
  \$password:String!
  )
  {
  login(
    username: \$username,
    password: \$password,
  ){
    ...on CurrentUser{
        id
        identifier
        channels{
          token
        }
        }
  }
  }


"""),
          variables: {
            "username": username,
            "password": password,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }
      print("Utsav Shrestha");
      if (result.context
              .entry<HttpLinkResponseContext>()!
              .headers!["vendure-auth-token"] !=
          null) {
        final authToken = result.context
            .entry<HttpLinkResponseContext>()!
            .headers!["vendure-auth-token"]!;
        print(authToken);
        final id = result.data!["login"]["id"];
        final identifier = result.data!["login"]["identifier"];
        await Hive.box<String>(DatabaseHelper.authTokenDB).put(
            "token",
            result.context
                .entry<HttpLinkResponseContext>()!
                .headers!["vendure-auth-token"]!);
        Navigator.pop(context);
        await fetchUser(id, identifier, authToken);
        userController.isLoggedIn.value = true;
      } else {
        print("Wrong credentials");
        OurToast().showErrorToast("Wrong credentials");
      }
      Get.find<ProgressController>().changeValue(false);

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      print(result.data);
      print("===============================");
    } catch (e) {
      print("object");
      OurToast().showErrorToast("No internet connection");
      print(e);
    }
  }

  // log out
  Future<void> userLogout(BuildContext context) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    print("Inside user logout api");
    Get.find<ProgressController>().changeValue(true);

    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
          mutation Logout {
            logout {
              success
            }
          }
        """),
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      final dynamic data = result.data!['logout'];

      if (data['success'] == true) {
        // Logout was successful

        await Hive.box<String>(DatabaseHelper.authTokenDB).delete("token");
        Get.find<UserController>().isLoggedIn.value = false;
        OurToast().showErrorToast("Sucessfuly! Logged out ");
      } else {
        print("Logout failed");
        OurToast().showErrorToast("No user logged in !");
      }
      Get.find<ProgressController>().changeValue(false);
    } catch (e) {
      print("Error during logout: $e");
      OurToast().showErrorToast("Error during logout");
    }
  }

  //sign up customer
  Future<RegisterCustomerAccountResult> registerCustomerAccount(
      CreateCustomerInput input) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();

    try {
      final QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql('''
          mutation RegisterCustomer(\$input: RegisterCustomerInput!) {
            registerCustomerAccount(input: \$input) {
              __typename
              ... on Success {
                success
              }
              ... on MissingPasswordError {
               
                message
              }
              ... on PasswordValidationError {
                message
              }
              ... on NativeAuthStrategyError {
              message
              }
            }
          }
        '''),
          variables: {
            'input': input.toJson(),
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final dynamic data = result.data!['registerCustomerAccount'];

      if (data['__typename'] == 'Success') {
        await sendOTP(input.emailAddress);
        Get.to(OTPScreen());
        print(data);
        return SuccessResult(success: data['success']);
      } else if (data['__typename'] == 'MissingPasswordError') {
        return MissingPasswordErrorResult(
          errorMessage: data['message'],
        );
      } else if (data['__typename'] == 'PasswordValidationError') {
        return PasswordValidationErrorResult(
          errorMessage: data['message'],
        );
      } else if (data['__typename'] == 'NativeAuthStrategyError') {
        return NativeAuthStrategyErrorResult(
          errorMessage: data['message'],
        );
      } else {
        throw Exception('Unexpected result type: ${data['__typename']}');
      }
    } catch (e) {
      throw Exception('Failed to register customer account: $e');
    }
  }
  //Token verification

//   tokenVerification(String token) async {
//     GraphQLConfig graphQLConfig = GraphQLConfig();
//     GraphQLClient client = graphQLConfig.clientTOQuery();
//     try {
//       final QueryResult result = await client.mutate(
//         MutationOptions(
//           fetchPolicy: FetchPolicy.cacheAndNetwork,
//           document: gql('''
//           mutation VerifyCustomerAccount($token: String!) {
//          verifyCustomerAccount(token: $token) {
//                __typename
//                       ... on CurrentUser {
//                    id
//                           identifier
//                      channels {
//                           id
//                              token
//                          code

//          }
//     }
//     ... on VerificationTokenInvalidError {

//       message
//     }
//     ... on VerificationTokenExpiredError {

//       message
//     }
//     ... on MissingPasswordError {

//       message
//     }
//     ... on PasswordValidationError {

//       message
//       validationErrorMessage
//     }
//     ... on PasswordAlreadySetError {

//       message
//     }
//     ... on NativeAuthStrategyError {

//       message
//     }
//   }
// }

//         '''),
//           variables: {
//             'token': token,
//           },
//         ),
//       );

//       if (result.hasException) {
//         throw Exception(result.exception.toString());
//       }
//       final dynamic data = result.data!['verifyCustomerAccount'];

//       final String typeName = data['__typename'];
//       final String id_user = data['__typeName']['id'];
//       final String name_user = data['__typeName']['identifier'];
//       final ErrorCode error_code =
//           parseErrorCode(data['__typeName']['errorCode']);
//       final String message = data['__typeName']['message'];

//       final List<CurrentUserChannel> channels =
//           (data['__typeName'] as List<dynamic>)
//               .map<CurrentUserChannel>((channelData) {
//         return CurrentUserChannel(
//           id: channelData['id'],
//           token: channelData['token'],
//           code: channelData['code'],
//         );
//       }).toList();

//       if (typeName == 'CurrentUser') {
//         Get.to(LoginScreen());
//         return CurrentUser(
//           identifier: name_user,
//           id: id_user,
//           channels: channels,
//         );
//       }
//       //error handlings
//       else if (typeName == 'VerificationTokenInvalidError') {
//         return VC.VerificationTokenInvalidError(
//             errorCode: error_code, message: message);
//       } else if (typeName == 'VerificationTokenInvalidError') {
//         return VC.VerificationTokenInvalidError(
//             errorCode: error_code, message: message);
//       } else if (typeName == 'MissingPasswordError') {
//         return VC.MissingPasswordError(errorCode: error_code, message: message);
//       } else if (typeName == 'PasswordValidationError') {
//         return VC.PasswordValidationError(
//             errorCode: error_code,
//             message: message,
//             validationErrorMessage: 'Validation Error');
//       } else if (typeName == 'PasswordAlreadySetError') {
//         return VC.PasswordAlreadySetError(
//           errorCode: error_code,
//           message: message,
//         );
//       } else if (typeName == 'NativeAuthStrategyError') {
//         return NativeAuthStrategyError(errorCode: error_code, message: message);
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

  //send verification otp
  sendOTP(String? email) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    try {
      final QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql('''
          mutation VerifyCustomerAccount(\$email: String!) {
 refreshCustomerVerification(emailAddress: \$email) {
      __typename
  ... on Success
  {
success
  }
  ...on NativeAuthStrategyError
  {
message
  errorCode
  }
  ... on ErrorResult
  {
    errorCode
    message
  }
       
      }
    }
    

        '''),
          variables: {
            'email': email,
          },
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception.toString());
      }
      final dynamic data = result.data!['refreshCustomerVerification'];
      final String typeName = data['__typename'];
      final bool success = data['__typename']['success'];
      final ErrorCode error_code =
          parseErrorCode(data['__typeName']['errorCode']);
      final String message = data['__typeName']['message'];
      if (typeName == 'Success') {
        return Sucess(sucess: success);
      } else if (typeName == 'NativeAuthStrategyError') {
        return NativeAuthStrategyError(errorCode: error_code, message: message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //fetch User
  // Fetch User with user information
  fetchUser(String id, String identifier, String authToken) async {
    try {
      if (authToken.isNotEmpty) {
        // Tokens match, proceed with using the token and user info
        print("Stored Token: $authToken");
        print("User ID: $id");
        print("User Identifier: $identifier");

        // Set the username in the UserController
        Get.find<UserController>().setUserDetails(identifier);
        Get.find<UserController>().setImg(id);
      } else {
        print("Stored token is empty.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
      // Handle the error as needed, e.g., show an error message
      // OurToast().showErrorToast("Error fetching user data: $e");
    }
  }

  // add product to cart

  addToCart(int productVarientID, int quantity, BuildContext context,
      {bool show = true}) async {
    print("Inside add to cart api");
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    Get.find<ProgressController>().changeValue(true);
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
mutation QueryAddToCart(
  \$productVarientID: ID!
  \$quantity:Int!
  )
  {
  addItemToOrder(
    productVariantId: \$productVarientID,
    quantity: \$quantity,
  ){
   ...on Order {
      id
    }
    ...on ErrorResult {
      message
    }
  }
  }


"""),
          variables: {
            "productVarientID": productVarientID,
            "quantity": quantity,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }
      // print(result);
      //  result.data!["product"]["variants"]
      if (result.data!["addItemToOrder"]["id"] != null) {
        if (show == true) {
          NotificationService().simpleNotification(
            "Product added to cart",
          );
          OurToast().showErrorToast("Product added to cart");
        }
      } else {
        print("Double hello World");
      }
      Get.find<ProgressController>().changeValue(false);

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      print(result.data);
      print("===============================");
    } catch (e) {
      print("object");
      print(e);
    }
  }

//to get current cart items
  static Future<ActiveOrderModel?> getcurrentCart() async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();

    // print("Inside Current cart api");
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
query Query(
){

    activeOrder{
    id
    state,
    currencyCode
    lines{
      id
      productVariant{
        id
        name
        price
        assets{
          preview
        }
        product {
          featuredAsset {
            source
          }
        }
      }
      unitPrice
      quantity
    }
    subTotal
    totalWithTax
    totalQuantity
    
    
  }
}
"""),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }
      // print(result.data!["activeOrder"]);
      ActiveOrderModel activeOrderModel =
          ActiveOrderModel.fromJson(result.data!["activeOrder"]);
      // print(activeOrderModel);
      return activeOrderModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

//add / minus item from cart
  addremoveMutation(int orderLineId, int quantity) async {
    print("Inside add remove product api");
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();

    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
mutation QueryAddToCart(
  \$orderLineId: ID!
  \$quantity:Int!
  )
  {
  adjustOrderLine(
    orderLineId: \$orderLineId,
    quantity: \$quantity,
  ){
  __typename
  }
  }


"""),
          variables: {
            "orderLineId": orderLineId,
            "quantity": quantity,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }
      // print(result);
      //  result.data!["product"]["variants"]

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      print(result.data);
      print("===============================");
      Get.find<ProgressController>().changeValue(true);
    } catch (e) {
      print("object");
      print(e);
    }
  }

//to remove item from cart
  removeItemFromCart(int orderLineId) async {
    print("Inside add remove product api");
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    Get.find<ProgressController>().changeValue(true);
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
mutation QueryAddToCart(
  \$orderLineId: ID!
  
  )
  {
  removeOrderLine(
    orderLineId: \$orderLineId,
   
  ){
  __typename
  }
  }


"""),
          variables: {
            "orderLineId": orderLineId,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }
      // print(result);
      //  result.data!["product"]["variants"]

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      print(result.data);
      print("===============================");
      Get.find<ProgressController>().changeValue(true);
    } catch (e) {
      print("object");
      print(e);
    }
  }

  //to get current cart items
  // static Future<ActiveOrderModel?>
  static Future<List<String>?> getFavoriteItemsList() async {
    List<String> productListId = [];
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();

    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
query Query(
){

    activeCustomer{
    customFields{
      favorites{
        id
      }
    }
  }
}
"""),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }
      if (result.data!["activeCustomer"] != null) {
        result.data!["activeCustomer"]["customFields"]["favorites"]
            .forEach((e) {
          productListId.add(e["id"]);
        });
      }

      return productListId;
      // return activeOrderModel;
    } catch (e) {
      print("hiii");
      print(e);
    }
    return null;
  }

  //Add item to favorite list
  addToFavorite(String productId, List<String> favlist, String imageUrl) async {
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    print("Inside add to favorite api");
    bool value = false;
    List<String> myfavoriteList = favlist;
    if (myfavoriteList.contains(productId)) {
      value = false;
      myfavoriteList.remove(productId);
    } else {
      value = true;
      myfavoriteList.add(productId);
    }
    print("===========");
    print(myfavoriteList);
    print("===========");

    Get.find<ProgressController>().changeValue(true);
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
mutation QueryLogin(
  \$myfavoriteList: [ID!]
  )
  {
   updateCustomer(input:{
    customFields:{
      favoritesIds: \$myfavoriteList
    }
  }){
    __typename
  }
  }


"""),
          variables: {
            "myfavoriteList": myfavoriteList,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      print(result.data);
      if (value) {
        NotificationService().simpleBigPictureNotification(
            "Product added to favorite list", imageUrl);
        OurToast().showErrorToast("Product added to favorite list");
      } else {
        NotificationService().simpleBigPictureNotification(
            "Product removed from favorite list", imageUrl);
        OurToast().showErrorToast("Product removed to favorite list");
      }

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      print(result.data);
      print("===============================");
    } catch (e) {
      print("object");
      print(e);
    }
  }

  // add review

  submitReview(
      int productId, double rateValue, String ratetext, BuildContext context,
      {bool show = true}) async {
    print("Inside review api");
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    Get.find<ProgressController>().changeValue(true);
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
mutation GiveReview(
  \$productId: ID!
  \$ratetext:String!
  \$rateValue:Float!

  )
  {
    submitProductReview(
    input:{
       productId: \$productId,
    body: \$ratetext,
    rating: \$rateValue,  
    }
  ){
    __typename
  }
 
  }


"""),
          variables: {
            "productId": productId,
            "rateValue": rateValue,
            "ratetext": ratetext,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }
      // print(result);
      //  result.data!["product"]["variants"]
      // if (result.data!["addItemToOrder"] != null) {
      NotificationService().simpleNotification(
        "Review submitted",
      );
      OurToast().showErrorToast(
        "Review submitted",
      );
      Navigator.pop(context);
      // } else {
      //   OurToast().showErrorToast("Something went wrong");
      // }

      // print(result.data!["search"]["items"]
      // !["collections"]["items"].length
      print(result.data);
      print("===============================");
    } catch (e) {
      print("object");
      print(e);
    }
  }

  static Future<RatingDetailModel?> getReviewDetail(
      int productId, String productSlug,
      {bool show = true}) async {
    // print("Inside review detail api");
    GraphQLConfig graphQLConfig = GraphQLConfig();
    GraphQLClient client = graphQLConfig.clientTOQuery();
    Get.find<ProgressController>().changeValue(true);
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: gql("""
query Query(\$productID: ID
\$productSlug:String
){
    product(
   id: \$productID
  slug: \$productSlug
  )
      
   {
   customFields{
      reviewCount
      reviewRating
    }
    description
   
    reviews{
      items{
        updatedAt
        downvotes
        upvotes
        createdAt
        authorName
        id
        body
        rating
      }
      totalItems
      
    }
  }
}
"""),
          variables: {
            "productID": productId,
            "productSlug": productSlug,
          },
        ),
      );
      // print("object");
      RatingDetailModel ratingDetailModel =
          RatingDetailModel.fromJson(result.data!["product"]);

      // print(ratingDetailModel.toJson());
      return ratingDetailModel;

      // print(result.data!["product"]);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
