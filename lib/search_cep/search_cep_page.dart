import 'package:flutter/material.dart';
import 'package:my_utils_app/common/utils/nav.dart';
import 'package:my_utils_app/common/widgets/app_text.dart';
import 'package:my_utils_app/search_cep/search_cep.dart';
import 'package:my_utils_app/search_cep/search_cep_form_page.dart';

class SearchCEPPage extends StatefulWidget {
  final SearchCEP searchCEP;

  const SearchCEPPage(this.searchCEP, {super.key});

  @override
  State<SearchCEPPage> createState() => _SearchCEPPageState();
}

class _SearchCEPPageState extends State<SearchCEPPage> {
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
          "Endereço Encontrado",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _onPressedBack() {
    push(context, const SearchCEPFormPage());
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              AppText("Rua: ${widget.searchCEP.address}"),
              const SizedBox(height: 20),
              AppText("Bairro: ${widget.searchCEP.district}"),
              const SizedBox(height: 20),
              AppText(
                "Cidade: ${widget.searchCEP.city} - ${widget.searchCEP.state}",
              ),
              const SizedBox(height: 20),
              AppText("CEP: ${widget.searchCEP.code}"),
              const SizedBox(height: 20),
            ],
          ),
          // AppButton(
          //   "Abrir com Maps",
          //   onPressed: _onPressedOpenWithMaps,
          //   showProgress: false,
          // ),
        ],
      ),
    );
  }

  void _onPressedOpenWithMaps() {
    // String address = widget.searchCEP.address!;
    // String district = widget.searchCEP.district!;
    // String code = widget.searchCEP.code!;
    // String city = widget.searchCEP.city!;
    // String state = widget.searchCEP.state!;

    // String formattedAddress = '$address, $district, $city - $state, $code';

  }
}
