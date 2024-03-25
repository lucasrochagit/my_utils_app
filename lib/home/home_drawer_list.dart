import 'package:flutter/material.dart';
import 'package:my_utils_app/common/utils/nav.dart';
import 'package:my_utils_app/common/widgets/app_text.dart';
import 'package:my_utils_app/search_cep/search_cep_form_page.dart';

class HomeDrawerList extends StatefulWidget {
  bool? withHeader;

  HomeDrawerList({
    super.key,
    this.withHeader = false,
  });

  @override
  State<HomeDrawerList> createState() => _HomeDrawerListState();
}

class _HomeDrawerListState extends State<HomeDrawerList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: _children(),
          ),
        ),
      ),
    );
  }

  _children() {
    var items = [
      const SizedBox(height: 10),
      ListTile(
        leading: const Icon(Icons.search_outlined, size: 40),
        title: const Text("Busca CEP"),
        subtitle: const Text("Buscar endereço por CEP"),
        onTap: () {
          push(
            context,
            const SearchCEPFormPage(),
          );
        },
      ),
    ];
    if (widget.withHeader!) {
      items.insert(
          0,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText("Utilitários Disponíveis"),
            ],
          ));
      items.insert(0, const SizedBox(height: 10));
    }

    return items;
  }
}
