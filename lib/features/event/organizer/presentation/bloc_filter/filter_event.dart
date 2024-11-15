part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class FilterInitialEvent extends FilterEvent {
  final int pageNumber;
  final int pageSize;
  final String? name;
  final bool? isFavourite;
  final String? dateFrom;
  final String? dateTo;
  final int? categoryId;
  final double? minFeeCost;
  final double? maxFeeCost;

  FilterInitialEvent({
    required this.pageNumber,
    required this.pageSize,
    this.name,
    this.isFavourite,
    this.dateFrom,
    this.dateTo,
    this.categoryId,
    this.minFeeCost,
    this.maxFeeCost,
  });
}
