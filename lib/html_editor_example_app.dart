import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                hint: 'Your text here...',
                shouldEnsureVisible: true,
                //initialText: "<p>text content initial, if any</p>",
              ),
              htmlToolbarOptions: HtmlToolbarOptions(
                defaultToolbarButtons: [
                  OtherButtons(fullscreen: false, codeview: false, help: false),
                  FontButtons(superscript: false, subscript: false, strikethrough: false),
                  ListButtons(listStyles: false, ol: true, ul: true),
                  InsertButtons(link: true, picture: false, audio: false, video: false, otherFile: false, table: false, hr: false),
                ],
                toolbarPosition: ToolbarPosition.belowEditor,
                //by default
                toolbarType: ToolbarType.nativeGrid,
                //by default
                renderSeparatorWidget: false,
              ),
              otherOptions: OtherOptions(),
            ),
          ],
        ),
      ),
    );
  }
}
