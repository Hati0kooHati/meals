import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink("https://meals-igdt.onrender.com/graphql");

final clientProvider = Provider(
  (ref) => GraphQLClient(link: _httpLink, cache: GraphQLCache()),
);
