part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();

  @override
  List<Object> get props => [];
}

class PatientsInitial extends PatientsState {}

class PatientLoadingState extends PatientsState {}

class PatientLoadedState extends PatientsState {
  final Patient patient;

  const PatientLoadedState(this.patient);
}

class PatientsLoadedState extends PatientsState {
  final Patients patients;

  const PatientsLoadedState(this.patients);
}

class PatientUpdatedState extends PatientsState {
  final Patient patient;

  const PatientUpdatedState(this.patient);
}

class PatientDeletedState extends PatientsState {}

class PatientErrorState extends PatientsState {
  final String errorMessage;

  const PatientErrorState(this.errorMessage);
}

class PatientDeleteErrorState extends PatientsState {
  final String errorMessage;

  const PatientDeleteErrorState(this.errorMessage);
}