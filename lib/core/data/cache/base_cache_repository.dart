import 'dart:convert';


import 'base_cache.dart';
import 'jsonable.dart';

abstract class BaseCacheRepository {
  final BaseCache cache;

  BaseCacheRepository(this.cache);

  Future<T> cacheAsideDuraton<T extends Jsonable>(
    String cacheKey,
    Future<T> Function() source,
    T Function(Map<String, dynamic> data) factory,
    Duration? duration,
  ) async {
    if (await cache.has(cacheKey)) {
      String? response = await cache.get(cacheKey);
      return factory(jsonDecode(response!) as Map<String, dynamic>);
    }

    var res = await source();

    if (duration == null) {
      await cache.forever(cacheKey, jsonEncode(res.toJson()));
    } else {
      await cache.put(cacheKey, jsonEncode(res.toJson()), duration);
    }

    return res;
  }

  Future<T> cacheAside24h<T extends Jsonable>(
    String cacheKey,
    Future<T> Function() source,
    T Function(Map<String, dynamic> data) factory,
  ) async {
    return cacheAsideDuraton(cacheKey, source, factory, const Duration(hours: 24));
  }

  Future<T> cacheAsideForever<T extends Jsonable>(
    String cacheKey,
    Future<T> Function() source,
    T Function(Map<String, dynamic> data) factory,
  ) async {
    return cacheAsideDuraton(cacheKey, source, factory, null);
  }
}
