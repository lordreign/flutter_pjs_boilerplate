import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String loginId = '';
  String name = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'LOGIN ID',
            ),
            onSaved: (val) {
              if (val != null) {
                setState(() {
                  loginId = val;
                });
              }
            },
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return '로그인 아이디 필수..';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'NAME',
            ),
            onSaved: (val) {
              if (val != null) {
                setState(() {
                  name = val;
                });
              }
            },
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return '이름은 필수..';
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Map<String, dynamic> result = {
                    'result': false,
                  };
                  Navigator.of(context).pop(result);
                },
              ),
              TextButton(
                child: const Text('CONFIRM'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Map<String, dynamic> result = {
                      'result': true,
                      'loginId': loginId,
                      'name': name,
                    };
                    Navigator.of(context).pop(result);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
