import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'species_tile_closed_model.dart';
export 'species_tile_closed_model.dart';

class SpeciesTileClosedWidget extends StatefulWidget {
  const SpeciesTileClosedWidget({Key? key}) : super(key: key);

  @override
  _SpeciesTileClosedWidgetState createState() =>
      _SpeciesTileClosedWidgetState();
}

class _SpeciesTileClosedWidgetState extends State<SpeciesTileClosedWidget> {
  late SpeciesTileClosedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpeciesTileClosedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.delete_outlined,
        color: FlutterFlowTheme.of(context).secondaryText,
      ),
      title: Text(
        '[Species name]',
        style: FlutterFlowTheme.of(context).title3,
      ),
      subtitle: Text(
        '[Scientific name]',
        style: FlutterFlowTheme.of(context).bodyText2,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: Color(0xFF303030),
        size: 20.0,
      ),
      dense: false,
    );
  }
}
