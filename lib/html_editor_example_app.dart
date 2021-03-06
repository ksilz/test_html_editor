import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    final editor = HtmlEditor(
      controller: controller,
      htmlEditorOptions: HtmlEditorOptions(
        hint: 'Your text here...',
        shouldEnsureVisible: true,
        //initialText: "<p>text content initial, if any</p>",
      ),
      htmlToolbarOptions: HtmlToolbarOptions(
        defaultToolbarButtons: [
          OtherButtons(fullscreen: false, codeview: false, help: false, undo: false, redo: false),
          FontButtons(superscript: false, subscript: false, strikethrough: false),
          ListButtons(listStyles: false, ol: true, ul: true),
          InsertButtons(link: true, picture: false, audio: false, video: false, otherFile: false, table: false, hr: false),
        ],
        toolbarPosition: ToolbarPosition.belowEditor,
        toolbarType: ToolbarType.nativeGrid,
        renderSeparatorWidget: false,
      ),
      otherOptions: OtherOptions(),
    );

    return PlatformScaffold(
      material: (_, __) => MaterialScaffoldData(
        extendBodyBehindAppBar: false,
        extendBody: false,
      ),
      cupertino: (_, __) => CupertinoPageScaffoldData(resizeToAvoidBottomInset: true, resizeToAvoidBottomInsetTab: true),
      appBar: PlatformAppBar(
        title: Text(widget.title),
        material: (_, __) => MaterialAppBarData(
          automaticallyImplyLeading: true,
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Platform.isIOS
                  ? Material(
                      color: Colors.transparent,
                      child: Localizations(
                        locale: const Locale('en', 'UK'),
                        delegates: <LocalizationsDelegate<dynamic>>[
                          DefaultWidgetsLocalizations.delegate,
                          DefaultMaterialLocalizations.delegate,
                        ],
                        child: editor,
                      ),
                    )
                  : editor,
            ],
          ),
        ),
      ),
    );
  }
}
