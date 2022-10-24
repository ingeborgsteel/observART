import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvart_har_du_sett/api/api.dart';
import 'package:hvart_har_du_sett/models/taxon.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  var _inputValue = '';
  var _searchValue = '';

  Future<Iterable<Taxon>?> _taxonSearch(String searchTerm) async {
    if (searchTerm != '') {
      final response = await api.taxon.searchForTaxons(searchTerm);
      if (response.statusCode != 200) {
        throw Exception('Failed to load search result');
      }
      final json = jsonDecode(response.body) as List;
      return json.map((taxon) {
        return Taxon.fromJson(taxon);
      });
    }
    return null;
  }

  FutureBuilder<Iterable<Taxon>?> _buildSearchResult(String searchTerm) {
    return FutureBuilder(
        future: _taxonSearch(searchTerm),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            Iterable<Taxon>? searchResult = snapshot.data;
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        SizedBox(
            width: 100,
            child: TextField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Søk etter arter...',
                  contentPadding: EdgeInsets.all(10)),
              onChanged: (value) {
                setState(() {
                  _inputValue = value;
                });
              },
            )),
        SizedBox(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _searchValue = _inputValue;
                });
              },
              child: const Text('Søk')),
        )
      ]),
      _buildSearchResult(_searchValue)
    ]);
  }
}
