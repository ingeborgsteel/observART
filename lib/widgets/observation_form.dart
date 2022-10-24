import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hvart_har_du_sett/screens/save_page.dart';
import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

class ObservationForm extends StatefulWidget {
  const ObservationForm({super.key});

  @override
  State<ObservationForm> createState() => _ObservationFormState();
}

class _ObservationFormState extends State<ObservationForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  var _formIsExpanded = false;
  final _fieldPadding = 10.0;

  void _registerObservation() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(AppConstants.appName)),
          body: const SavePage());
    }));
  }

  @override
  Widget build(BuildContext context) {
    final Size _mediaQuery = MediaQuery.of(context).size;

    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _formIsExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('Registrer observasjon'),
                    );
                  },
                  isExpanded: _formIsExpanded,
                  body: Column(children: [
                    FormBuilder(
                      key: _formKey,
                      child: Column(children: [
                        FormBuilderTextField(
                          name: 'locationName',
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Lokalitetsnavn',
                            contentPadding: EdgeInsets.all(_fieldPadding),
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (String? value) {},
                        ),
                        FormBuilderTextField(
                          name: 'coObserver',
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Medobservatør',
                            contentPadding: EdgeInsets.all(_fieldPadding),
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (String? value) {},
                        ),
                        FormBuilderSlider(
                          // TODO consider using NumberPicker instead https://pub.dev/packages/numberpicker/example
                          name: 'accuracy',
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Nøyaktighet',
                            contentPadding: EdgeInsets.all(_fieldPadding),
                          ),
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
                                format: DateFormat.yMd().add_Hm(),
                                initialValue: DateTime.now(),
                                inputType: InputType.both,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(),
                                  labelText: 'Starttid for observasjon',
                                  contentPadding: EdgeInsets.all(_fieldPadding),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: _mediaQuery.width * 0.5,
                                child: FormBuilderDateTimePicker(
                                  name: 'observationTimeEnd',
                                  initialEntryMode:
                                      DatePickerEntryMode.calendar,
                                  inputType: InputType.time,
                                  initialValue: DateTime.now()
                                      .add(const Duration(minutes: 30)),
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    labelText: 'Sluttid for observasjon',
                                    contentPadding:
                                        EdgeInsets.all(_fieldPadding),
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
                          onPressed: () {
                            _formKey.currentState?.save();
                            _registerObservation();
                          },
                        ))
                  ]))
            ]));
  }
}
