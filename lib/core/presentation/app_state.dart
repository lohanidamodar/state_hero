import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_hero/core/data/services/api_service.dart';
import 'package:state_hero/features/quiz/data/models/category.dart';

final apiService = Provider((ref) => ApiService());

final categoriesProvider = FutureProvider<List<Category>>((ref){
  return ref.read(apiService).getCategories();
});