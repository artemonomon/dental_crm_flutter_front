part of 'patients_bloc.dart';

abstract class PatientsEvent extends Equatable {
  const PatientsEvent();

  @override
  List<Object> get props => [];
}

class PatientInitialEvent extends PatientsEvent {}

class SavePatientEvent extends PatientsEvent {
  final SaveRequest request;

  const SavePatientEvent(this.request);
}

class UpdatePatientEvent extends PatientsEvent {
  final int id;
  final UpdateRequest request;

  const UpdatePatientEvent(this.id, this.request);
}

class GetPatientsEvent extends PatientsEvent {}

class GetPatientByIdEvent extends PatientsEvent {
  final int id;

  const GetPatientByIdEvent(this.id);
}

class DeletePatientEvent extends PatientsEvent {
  final int id;

  const DeletePatientEvent(this.id);
}
