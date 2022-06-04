import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextFormField(
                autofocus: false,
                initialValue: '',
                textCapitalization: TextCapitalization.words,
                onChanged: (String value) {},
                validator: (value) {
                  if (value == "") {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Nombre del usuario',
                  labelText: 'Nombre',
                  helperText: 'Solo letras',
                  counterText: 'X carácteres',
                  suffixIcon: Icon(Icons.group_outlined),
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  icon: Icon(Icons.admin_panel_settings_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    )
                  )
                ),
              )],
          ),
        ),
      ),
    );
  }
}

class Borderside {
}
