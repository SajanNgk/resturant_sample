import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';

import 'db/db_helper.dart';

// class GraphQLConfig {
//   static HttpLink httpLink = HttpLink(
//     'https://admin.hyperce.io/shop-api/',
//   );
//   GraphQLClient clientTOQuery() => GraphQLClient(
//         link: httpLink,
//         cache: GraphQLCache(store: HiveStore()),
//       );
// }

class GraphQLConfig
// Auth
{
  Link? link;
  HttpLink httpLink = HttpLink(
    'https://admin.hyperce.io/shop-api/',
  );

  GraphQLConfig() {
    // print("hhhhoooooooooooooooooooooooooooooooooooo");
    if (Hive.box<String>(DatabaseHelper.authTokenDB)
            .get("token", defaultValue: "")! !=
        "") {
      AuthLink authLink = AuthLink(
          getToken: () async =>
              'Bearer ${Hive.box<String>(DatabaseHelper.authTokenDB).get("token", defaultValue: "") ?? "AA"}');
      link = authLink.concat(httpLink as Link);
    } else {
      link = httpLink as Link;
    }
  }

  GraphQLClient clientTOQuery() => GraphQLClient(
        link: link!,
        cache: GraphQLCache(store: HiveStore()),
      );
}
