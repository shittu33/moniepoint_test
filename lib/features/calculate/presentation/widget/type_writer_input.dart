import 'dart:async';
import 'package:flutter/material.dart';

class TypingAnimationWidget extends StatefulWidget {
  @override
  _TypingAnimationWidgetState createState() => _TypingAnimationWidgetState();
}

class _TypingAnimationWidgetState extends State<TypingAnimationWidget> {
  TextEditingController _textEditingController= TextEditingController();
  Timer? _timer;
  int _index = 0;
  String _text = '';
  List<String> _textList = [
    'Hello',
    'How are you?',
    'I am a Flutter developer!',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _text += _textList[_index][_text.length];
        if (_text.length == _textList[_index].length) {
          _timer?.cancel();
          _index = (_index + 1) % _textList.length;
          _timer = Timer(Duration(seconds: 2), () {
            _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
              setState(() {
                _text = _text.substring(0, _text.length - 1);
                if (_text.isEmpty) {
                  _timer?.cancel();
                }
              });
            });
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _textEditingController,
          builder: (BuildContext context, Widget? child) {
            return TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Animated Text',
              ),
              // enabled: false,
            );
          },
        ),
      ),
    );
  }
}
