import 'package:flutter_generic_app/api/models/job.dart';
import 'package:graphql/client.dart';

class GetJobsRequestFailure implements Exception {}

class JobsApiClient {
  const JobsApiClient({GraphQLClient graphQLClient})
      : assert(graphQLClient != null),
        _graphQLClient = graphQLClient;

  factory JobsApiClient.create() {
    final httpLink = HttpLink(uri: 'https://api.graphql.jobs');
    final link = Link.from([httpLink]);
    return JobsApiClient(
      graphQLClient: GraphQLClient(cache: InMemoryCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<Job>> getJobs() async {
    var queries;
        final result = await _graphQLClient.query(
          QueryOptions(documentNode: gql(queries.getJobs)),
    );
    if (result.hasException) {
      throw GetJobsRequestFailure();
    }
    final data = result.data['jobs'] as List;
    return data.map((e) => Job.fromJson(e)).toList();
  }
}
