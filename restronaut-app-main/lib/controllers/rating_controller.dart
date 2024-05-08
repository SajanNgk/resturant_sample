import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/models/rating_detail_model.dart';

class RatingItemController {
  static Stream<RatingDetailModel?> getData(int id, String slug) =>
      Stream.periodic(Duration(seconds: 2)).asyncMap(
        (_) => GraphQLService.getReviewDetail(id, slug),
      );
}
