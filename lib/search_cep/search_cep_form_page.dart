import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_utils_app/common/services/api_response.dart';
import 'package:my_utils_app/common/utils/nav.dart';
import 'package:my_utils_app/common/widgets/app_alert.dart';
import 'package:my_utils_app/common/widgets/app_button.dart';
import 'package:my_utils_app/common/widgets/app_text_input.dart';
import 'package:my_utils_app/home/home_page.dart';
import 'package:my_utils_app/search_cep/search_cep.dart';
import 'package:my_utils_app/search_cep/search_cep_page.dart';
import 'package:my_utils_app/search_cep/search_cep_service.dart';

class SearchCEPFormPage extends StatefulWidget {
  const SearchCEPFormPage({super.key});

  @override
  State<SearchCEPFormPage> createState() => _SearchCEPFormPageState();
}

class _SearchCEPFormPageState extends State<SearchCEPFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final textCEPController = TextEditingController();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: BackButton(
          color: Colors.white,
          onPressed: _onPressedBack,
        ),
        title: const Text(
          "Busca CEP",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: _form(),
      ),
    );
  }

  _form() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          AppTextInput(
            "CEP",
            "Digite o CEP",
            controller: textCEPController,
            keyboardType: TextInputType.number,
            inputFormatters: [_inputCEPFormatter()],
            validator: _validateCEP,
          ),
          const Divider(),
          AppButton(
            "Buscar",
            onPressed: _onPressedSearch,
            showProgress: _showProgress,
          ),
        ],
      ),
    );
  }

  _inputCEPFormatter() {
    return MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  String? _validateCEP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o CEP';
    }
    if (value.length < 8) {
      return 'O CEP deve ter 8 dígitos';
    }
    return null;
  }

  _onPressedSearch() async {
    bool validate = _formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    String cep = textCEPController.text.replaceAll("-", "");
    ApiResponse<SearchCEP> response = await SearchCEPService.search(cep);

    if (!mounted) return;
    if (response.ok!) {
      push(context, SearchCEPPage(response.result!));
    } else {
      alert(context, response.msg!, title: "Não encontrado");
    }

    setState(() {
      _showProgress = false;
    });
  }

  _onPressedBack() {
    push(context, const HomePage());
  }
}
