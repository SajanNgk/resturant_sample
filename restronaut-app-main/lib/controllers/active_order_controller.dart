import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/models/our_active_order_model.dart';

class ActiveOrderController {
  static Stream<ActiveOrderModel?> getData() =>
      Stream.periodic(Duration(seconds: 2)).asyncMap(
        (_) => GraphQLService.getcurrentCart(),
      );
}
