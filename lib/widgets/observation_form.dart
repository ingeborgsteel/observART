import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ObservationForm extends StatefulWidget {
  const ObservationForm({super.key});

  @override
  State<ObservationForm> createState() => _ObservationFormState();
}

class _ObservationFormState extends State<ObservationForm> {
  @override
  Widget build(BuildContext context) {
    final Size _mediaQuery = MediaQuery.of(context).size;

    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox(
            height: _mediaQuery.height * 0.45,
            child: Column(children: [
              FormBuilder(
                onChanged: () {
                  // set state
                },
                child: Column(children: [
                  FormBuilderTextField(
                    name: 'locationName',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Lokalitetsnavn',
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (String? value) {},
                  ),
                  FormBuilderTextField(
                    name: 'coObserver',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Medobservatør',
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (String? value) {},
                  ),
                  FormBuilderSlider(
                    // TODO consider using NumberPicker instead https://pub.dev/packages/numberpicker/example
                    name: 'accuracy',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nøyaktighet'),
                    initialValue: 50,
                    min: 0,
                    max: 150,
                    divisions: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _mediaQuery.width * 0.5,
                        child: FormBuilderDateTimePicker(
                          name: 'observationTimeStart',
                          initialEntryMode: DatePickerEntryMode.calendar,
                          initialValue: DateTime.now(),
                          initialTime: TimeOfDay.now(),
                          inputType: InputType.both,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Starttid for observasjon',
                          ),
                        ),
                      ),
                      SizedBox(
                          width: _mediaQuery.width * 0.5,
                          child: FormBuilderDateTimePicker(
                            name: 'observationTimeEnd',
                            initialEntryMode: DatePickerEntryMode.calendar,
                            inputType: InputType.time,
                            initialValue: DateTime.now(),
                            initialTime: TimeOfDay.now(),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Sluttid for observasjon',
                            ),
                          )),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                  width: _mediaQuery.width,
                  child: ElevatedButton(
                    child: const Text('Registrer observasjon'),
                    onPressed: () {},
                  ))
            ])));
  }
}
