import 'package:flutter/material.dart';
import 'package:textedit/utils/themes.dart';
import 'package:textedit/utils/validFunctions/text_validations.dart';
import 'package:textedit/widgets/basicInput.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(24.0),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: BasicInput(
                label: 'Usuário',
                icon: const Icon(Icons.people),
                myHintText: 'digite seu nickname',
                validatorFunction: (value) => validateUser(value),
                validationType: ValidationType.nickname,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: BasicInput(
                label: 'Senha',
                icon: const Icon(Icons.lock),
                myHintText: 'digite sua senha',
                validatorFunction: (value) => validatePass(value),
                validationType: ValidationType.pass,
              ),
            ),
            Container(
              margin: const EdgeInsets.only( top: 12, bottom: 52),
              child: ElevatedButton(
                onPressed: () => debugPrint('Clicou'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.tGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  fixedSize: const Size(156, 42)
                ),
                child: Text(
                  'Entrar',
                  style: MyFonts.style.kLabelMedium(context,
                    color: MyColors.pWhite,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => debugPrint('Política de privacidade'),
              child: Text(
                'Política de privacidade',
                style: MyFonts.style.kLabelMedium(context, color: MyColors.pWhite),
              ),
            )
          ],
        ),
    );
  }
}