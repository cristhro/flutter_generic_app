import 'package:flutter/material.dart';
import 'package:flutter_generic_app/api/models/job.dart';
import 'package:graphql/client.dart';

class GetJobsRequestFailure implements Exception {}

class JobsApiClient {
  const JobsApiClient({ @required  GraphQLClient graphQLClient})
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
        final result = await _graphQLClient.query(
          QueryOptions(documentNode: gql('queries.getJobs')),
    );
    if (result.hasException) {
      throw GetJobsRequestFailure();
    }
    final List<Map<String, dynamic>> data = result.data['jobs'] as List<Map<String, dynamic>>;
    return data.map((e) => Job.fromJson(e)).toList();
  }
}
