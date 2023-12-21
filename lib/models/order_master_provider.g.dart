// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_master_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getOrderLogDisplayHash() =>
    r'ff961f8354cdd8fdebdaadf4e4b863dd625c70ec';

/// See also [getOrderLogDisplay].
@ProviderFor(getOrderLogDisplay)
final getOrderLogDisplayProvider =
    AutoDisposeFutureProvider<List<OrderMasterState>>.internal(
  getOrderLogDisplay,
  name: r'getOrderLogDisplayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getOrderLogDisplayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOrderLogDisplayRef
    = AutoDisposeFutureProviderRef<List<OrderMasterState>>;
String _$putOrderLogToCallingHash() =>
    r'a890980ffa935ef340f1d125c0719d02f764bce8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [putOrderLogToCalling].
@ProviderFor(putOrderLogToCalling)
const putOrderLogToCallingProvider = PutOrderLogToCallingFamily();

/// See also [putOrderLogToCalling].
class PutOrderLogToCallingFamily extends Family<AsyncValue<void>> {
  /// See also [putOrderLogToCalling].
  const PutOrderLogToCallingFamily();

  /// See also [putOrderLogToCalling].
  PutOrderLogToCallingProvider call(
    int id,
  ) {
    return PutOrderLogToCallingProvider(
      id,
    );
  }

  @override
  PutOrderLogToCallingProvider getProviderOverride(
    covariant PutOrderLogToCallingProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'putOrderLogToCallingProvider';
}

/// See also [putOrderLogToCalling].
class PutOrderLogToCallingProvider extends AutoDisposeFutureProvider<void> {
  /// See also [putOrderLogToCalling].
  PutOrderLogToCallingProvider(
    int id,
  ) : this._internal(
          (ref) => putOrderLogToCalling(
            ref as PutOrderLogToCallingRef,
            id,
          ),
          from: putOrderLogToCallingProvider,
          name: r'putOrderLogToCallingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$putOrderLogToCallingHash,
          dependencies: PutOrderLogToCallingFamily._dependencies,
          allTransitiveDependencies:
              PutOrderLogToCallingFamily._allTransitiveDependencies,
          id: id,
        );

  PutOrderLogToCallingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(PutOrderLogToCallingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PutOrderLogToCallingProvider._internal(
        (ref) => create(ref as PutOrderLogToCallingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PutOrderLogToCallingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PutOrderLogToCallingProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PutOrderLogToCallingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PutOrderLogToCallingProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with PutOrderLogToCallingRef {
  _PutOrderLogToCallingProviderElement(super.provider);

  @override
  int get id => (origin as PutOrderLogToCallingProvider).id;
}

String _$postManualOrderHash() => r'9cb62a3843392c6085f4b7940ab031fb79f2c63b';

/// See also [postManualOrder].
@ProviderFor(postManualOrder)
const postManualOrderProvider = PostManualOrderFamily();

/// See also [postManualOrder].
class PostManualOrderFamily extends Family<AsyncValue<void>> {
  /// See also [postManualOrder].
  const PostManualOrderFamily();

  /// See also [postManualOrder].
  PostManualOrderProvider call(
    Ingredients ingredients,
  ) {
    return PostManualOrderProvider(
      ingredients,
    );
  }

  @override
  PostManualOrderProvider getProviderOverride(
    covariant PostManualOrderProvider provider,
  ) {
    return call(
      provider.ingredients,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postManualOrderProvider';
}

/// See also [postManualOrder].
class PostManualOrderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [postManualOrder].
  PostManualOrderProvider(
    Ingredients ingredients,
  ) : this._internal(
          (ref) => postManualOrder(
            ref as PostManualOrderRef,
            ingredients,
          ),
          from: postManualOrderProvider,
          name: r'postManualOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postManualOrderHash,
          dependencies: PostManualOrderFamily._dependencies,
          allTransitiveDependencies:
              PostManualOrderFamily._allTransitiveDependencies,
          ingredients: ingredients,
        );

  PostManualOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ingredients,
  }) : super.internal();

  final Ingredients ingredients;

  @override
  Override overrideWith(
    FutureOr<void> Function(PostManualOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostManualOrderProvider._internal(
        (ref) => create(ref as PostManualOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ingredients: ingredients,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PostManualOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostManualOrderProvider && other.ingredients == ingredients;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ingredients.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostManualOrderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `ingredients` of this provider.
  Ingredients get ingredients;
}

class _PostManualOrderProviderElement
    extends AutoDisposeFutureProviderElement<void> with PostManualOrderRef {
  _PostManualOrderProviderElement(super.provider);

  @override
  Ingredients get ingredients =>
      (origin as PostManualOrderProvider).ingredients;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
