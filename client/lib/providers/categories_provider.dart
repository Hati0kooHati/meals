import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/graphql_provider.dart';

final String _query = r"""
  query {
    categories {
      id
      title
      color
    }
  }
""";

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final result = await ref
      .watch(clientProvider)
      .query(QueryOptions(document: (gql(_query))));

  if (result.hasException) {
    throw Exception();
  }

  final data = result.data!["categories"] as List;
  return data.map((map) => Category.fromMap(map)).toList();
});
