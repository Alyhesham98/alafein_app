part of 'filter_bloc.dart';


abstract class FilterEvent {}

class FilterInitialEvent extends FilterEvent {
  final int pageNumber;
  final int pageSize;
  final String categoryName;
  final String dateFrom;
  final String dateTo;
  final double minFeeCost;
  final double maxFeeCost;

  FilterInitialEvent({
    required this.pageNumber,
    required this.pageSize,
    required this.categoryName,
    required this.dateFrom,
    required this.dateTo,
    required this.minFeeCost,
    required this.maxFeeCost,
  });
}

