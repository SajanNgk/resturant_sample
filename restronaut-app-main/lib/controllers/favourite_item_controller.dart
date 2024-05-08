import 'package:hyperce/api/graphql_service.dart';

class FavoriteItemController {
  static Stream<List<String>?> getData() =>
      Stream.periodic(Duration(seconds: 2)).asyncMap(
        (_) => GraphQLService.getFavoriteItemsList(),
      );
}
