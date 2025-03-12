import '/components/categories_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for categoriesComponent component.
  late CategoriesComponentModel categoriesComponentModel;

  @override
  void initState(BuildContext context) {
    categoriesComponentModel =
        createModel(context, () => CategoriesComponentModel());
  }

  @override
  void dispose() {
    categoriesComponentModel.dispose();
  }
}
