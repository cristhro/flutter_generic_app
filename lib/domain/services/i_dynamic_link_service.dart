import 'package:injectable/injectable.dart';

@injectable
abstract class IDynamicLinkService {
  Future handleDynamicLinks();
  Future<String> createFirstPostLink(String title);
}
