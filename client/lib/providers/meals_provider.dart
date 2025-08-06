import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/graphql_provider.dart';

final String _query = r"""
  query getMeals($id: ID!) {
    meals(id: $id) {
      id
      title
      imageUrl
      ingredients
      steps
      duration
      complexity
      affordability
    }
  }
""";

final mealsProvider = FutureProvider.family<List<Meal>, String>((
  ref,
  id,
) async {
  final result = await ref
      .watch(clientProvider)
      .query(QueryOptions(document: gql(_query), variables: {"id": id}));

  if (result.hasException) {
    throw Exception();
  }

  final data = result.data!["meals"] as List;

  return data.map((map) => Meal.fromMap(map)).toList();
});
