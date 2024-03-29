import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_resource.freezed.dart';

/// Represents a result that can either be successful, an error or indicate the
/// loading process.
///
/// The successful result returns nothing.
@freezed
class EmptyResource with _$EmptyResource {
  const factory EmptyResource.success() = Success;
  const factory EmptyResource.error(String message) = Error;
}
