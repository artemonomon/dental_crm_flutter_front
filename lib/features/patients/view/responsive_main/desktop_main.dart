import 'package:dental_crm_flutter_front/features/patients/bloc/patients_bloc.dart';
import 'package:dental_crm_flutter_front/features/patients/view/data_screen.dart';
import 'package:dental_crm_flutter_front/repositories/patient/patient_repository.dart';

import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopMain extends StatefulWidget {
  const DesktopMain({super.key});

  @override
  State<DesktopMain> createState() => _DesktopMainState();
}

class _DesktopMainState extends State<DesktopMain> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  PatientRepository patientRepository = PatientRepository();
  late PatientsBloc patientsBloc;

  @override
  void initState() {
    super.initState();
    patientsBloc = PatientsBloc(patientRepository);
    patientsBloc.add(GetPatientsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 240, 240),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSearchField(),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<PatientsBloc, PatientsState>(
                    bloc: patientsBloc,
                    builder: (context, state) {
                      if (state is PatientsLoadedState) {
                        return ListView.builder(
                            itemCount: state.patients.items.length,
                            itemBuilder: (context, index) {
                              final patient = state.patients.items[index];
                              return ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.w3schools.com/howto/img_avatar.png'),
                                ),
                                title: Text(patient.name),
                                subtitle: Text(patient.phone1),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PatientDataScreen(
                                              patientId: patient.id,
                                            )),
                                  );
                                },
                              );
                            });
                      } else if (state is PatientLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is PatientErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return const Center(
                          child: Text('No data'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/patients/add');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Пошук',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _isSearching
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    _isSearching = false;
                  });
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {
          _isSearching = value.isNotEmpty;
          // Perform search logic here
        });
      },
    );
  }
}
