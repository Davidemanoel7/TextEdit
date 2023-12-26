import 'package:flutter/material.dart';
import 'package:textedit/utils/themes.dart';

import 'package:mobx/mobx.dart';
import 'package:textedit/utils/validFunctions/text_validations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BasicInput extends StatelessWidget {
  BasicInput({
    Key? key,
    required this.label,
    required this.icon,
    this.myHintText,
    required this.validatorFunction,
    required this.validationType,
  }) : super(key: key);

  final String label;
  final Icon icon;
  final String? myHintText;
  final String Function(String? s) validatorFunction;

  final ValidationType validationType;
  final ValidInput validInput = ValidInput();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Text(
            label,
            style: MyFonts.style.kLabelMedium(context, color: MyColors.pWhite),
          ),
        ),
        Observer(
          warnWhenNoObservables: true,
          builder: (_) => Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              controller: textEditingController,
              style: const TextStyle(
                backgroundColor: MyColors.pWhite,
              ),
              onChanged: (value) {
                debugPrint('\n ${validationType.toString()} value => $value\n');
                validInput.updateIInput(value);
              },
              decoration: InputDecoration(
                prefixIcon: icon,
                hintText: myHintText,
                hintStyle: MyFonts.style.kLabelSmall(context, color: const Color.fromARGB(73, 0, 0, 0)),
                border: UnderlineInputBorder(borderRadius: BorderRadius.circular(8)),
                fillColor: MyColors.pWhite,
                filled: true,
              ),
              validator: (value) => validInput.isValid() ? '' : validInput.validationMessage(validationType),
            ),
          ),
        ),
      ],
    );
  }
}

enum ValidationType {nickname, pass}

class ValidInput = _ValidInput with Store;

abstract class _ValidInput with Store {
  @observable
  String inputValue = '';

  @computed
  String validationMessage(ValidationType type) {
    switch(type) {
      case ValidationType.nickname:
        var validUser = validateUser(inputValue);
        debugPrint('\t => $validUser');
        return validUser;
      case ValidationType.pass:
        var validPass = validatePass(inputValue);
        debugPrint('\t => $validPass');
        return validPass;
      default:
        return '';
    }
  }

  @action
  void updateIInput(String newString) {
    inputValue = newString;
  }

  @action
  bool isValid() {
    if (validationMessage(ValidationType.pass).isEmpty && validationMessage(ValidationType.nickname).isEmpty) {
      return true;
    }
    return false;
  }
}
