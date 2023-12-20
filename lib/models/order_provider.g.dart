// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cocktailOrderHash() => r'29d6247db65b23f5c877a638cad7485f7c88a72c';

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

/// See also [cocktailOrder].
@ProviderFor(cocktailOrder)
const cocktailOrderProvider = CocktailOrderFamily();

/// See also [cocktailOrder].
class CocktailOrderFamily extends Family<AsyncValue<int>> {
  /// See also [cocktailOrder].
  const CocktailOrderFamily();

  /// See also [cocktailOrder].
  CocktailOrderProvider call(
    int menuId,
  ) {
    return CocktailOrderProvider(
      menuId,
    );
  }

  @override
  CocktailOrderProvider getProviderOverride(
    covariant CocktailOrderProvider provider,
  ) {
    return call(
      provider.menuId,
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
  String? get name => r'cocktailOrderProvider';
}

/// See also [cocktailOrder].
class CocktailOrderProvider extends AutoDisposeFutureProvider<int> {
  /// See also [cocktailOrder].
  CocktailOrderProvider(
    int menuId,
  ) : this._internal(
          (ref) => cocktailOrder(
            ref as CocktailOrderRef,
            menuId,
          ),
          from: cocktailOrderProvider,
          name: r'cocktailOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cocktailOrderHash,
          dependencies: CocktailOrderFamily._dependencies,
          allTransitiveDependencies:
              CocktailOrderFamily._allTransitiveDependencies,
          menuId: menuId,
        );

  CocktailOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.menuId,
  }) : super.internal();

  final int menuId;

  @override
  Override overrideWith(
    FutureOr<int> Function(CocktailOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CocktailOrderProvider._internal(
        (ref) => create(ref as CocktailOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        menuId: menuId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _CocktailOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CocktailOrderProvider && other.menuId == menuId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, menuId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CocktailOrderRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `menuId` of this provider.
  int get menuId;
}

class _CocktailOrderProviderElement
    extends AutoDisposeFutureProviderElement<int> with CocktailOrderRef {
  _CocktailOrderProviderElement(super.provider);

  @override
  int get menuId => (origin as CocktailOrderProvider).menuId;
}

String _$getOrderListHash() => r'f3a50bbd07c05f3d354d7fa4210679dbdb8c50bd';

/// See also [getOrderList].
@ProviderFor(getOrderList)
final getOrderListProvider = FutureProvider<List<Order>>.internal(
  getOrderList,
  name: r'getOrderListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getOrderListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOrderListRef = FutureProviderRef<List<Order>>;
String _$notifyCompleteCocktailHash() =>
    r'78611951e6105b6925ceb00d2d6fe577802c6e24';

/// See also [notifyCompleteCocktail].
@ProviderFor(notifyCompleteCocktail)
const notifyCompleteCocktailProvider = NotifyCompleteCocktailFamily();

/// See also [notifyCompleteCocktail].
class NotifyCompleteCocktailFamily extends Family<AsyncValue<String>> {
  /// See also [notifyCompleteCocktail].
  const NotifyCompleteCocktailFamily();

  /// See also [notifyCompleteCocktail].
  NotifyCompleteCocktailProvider call(
    int orderId,
  ) {
    return NotifyCompleteCocktailProvider(
      orderId,
    );
  }

  @override
  NotifyCompleteCocktailProvider getProviderOverride(
    covariant NotifyCompleteCocktailProvider provider,
  ) {
    return call(
      provider.orderId,
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
  String? get name => r'notifyCompleteCocktailProvider';
}

/// See also [notifyCompleteCocktail].
class NotifyCompleteCocktailProvider extends AutoDisposeFutureProvider<String> {
  /// See also [notifyCompleteCocktail].
  NotifyCompleteCocktailProvider(
    int orderId,
  ) : this._internal(
          (ref) => notifyCompleteCocktail(
            ref as NotifyCompleteCocktailRef,
            orderId,
          ),
          from: notifyCompleteCocktailProvider,
          name: r'notifyCompleteCocktailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notifyCompleteCocktailHash,
          dependencies: NotifyCompleteCocktailFamily._dependencies,
          allTransitiveDependencies:
              NotifyCompleteCocktailFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  NotifyCompleteCocktailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int orderId;

  @override
  Override overrideWith(
    FutureOr<String> Function(NotifyCompleteCocktailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotifyCompleteCocktailProvider._internal(
        (ref) => create(ref as NotifyCompleteCocktailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _NotifyCompleteCocktailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotifyCompleteCocktailProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NotifyCompleteCocktailRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _NotifyCompleteCocktailProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with NotifyCompleteCocktailRef {
  _NotifyCompleteCocktailProviderElement(super.provider);

  @override
  int get orderId => (origin as NotifyCompleteCocktailProvider).orderId;
}

String _$getOrderStateHash() => r'8e10bdbb5229a29dfb6ba66d4a090fc91f16b896';

/// See also [getOrderState].
@ProviderFor(getOrderState)
const getOrderStateProvider = GetOrderStateFamily();

/// See also [getOrderState].
class GetOrderStateFamily extends Family<AsyncValue<String>> {
  /// See also [getOrderState].
  const GetOrderStateFamily();

  /// See also [getOrderState].
  GetOrderStateProvider call(
    int orderId,
  ) {
    return GetOrderStateProvider(
      orderId,
    );
  }

  @override
  GetOrderStateProvider getProviderOverride(
    covariant GetOrderStateProvider provider,
  ) {
    return call(
      provider.orderId,
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
  String? get name => r'getOrderStateProvider';
}

/// See also [getOrderState].
class GetOrderStateProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getOrderState].
  GetOrderStateProvider(
    int orderId,
  ) : this._internal(
          (ref) => getOrderState(
            ref as GetOrderStateRef,
            orderId,
          ),
          from: getOrderStateProvider,
          name: r'getOrderStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderStateHash,
          dependencies: GetOrderStateFamily._dependencies,
          allTransitiveDependencies:
              GetOrderStateFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  GetOrderStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int orderId;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetOrderStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderStateProvider._internal(
        (ref) => create(ref as GetOrderStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetOrderStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderStateProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOrderStateRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _GetOrderStateProviderElement
    extends AutoDisposeFutureProviderElement<String> with GetOrderStateRef {
  _GetOrderStateProviderElement(super.provider);

  @override
  int get orderId => (origin as GetOrderStateProvider).orderId;
}

String _$getOrderHistoryHash() => r'24dbe2cb2d500bdfb86e66fe6b07443c6f53107e';

/// See also [getOrderHistory].
@ProviderFor(getOrderHistory)
final getOrderHistoryProvider =
    AutoDisposeFutureProvider<List<OrderHistory>>.internal(
  getOrderHistory,
  name: r'getOrderHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getOrderHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOrderHistoryRef = AutoDisposeFutureProviderRef<List<OrderHistory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
