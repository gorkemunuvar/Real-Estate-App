part of 'estate_details_cubit.dart';

class EstateDetailsState extends Equatable {
  const EstateDetailsState({
    this.status = EstateDetailsStatus.initial,
    this.details,
  });

  final EstateDetailsStatus status;
  final EstateDetails? details;

  @override
  List<Object> get props => [status];

  EstateDetailsState copyWith({
    EstateDetailsStatus? status,
    EstateDetails? details,
  }) {
    return EstateDetailsState(
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }
}

enum EstateDetailsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
}
