import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Javier',
      'last_name' : 'Lledó',
      'email'     : 'javilledo@gmail.com',
      'password'  : '1234',
      'role'      : 'admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [

                CustomInputField(
                  hintText: 'Nombre del usuario',
                  labelText: 'Nombre',
                  helperText: 'Solo letras',
                  icon: Icons.admin_panel_settings_outlined,
                  suffixIcon: Icons.group_outlined, 
                  formProperty: 'first_name', 
                  formValues: formValues,
                ),

                const SizedBox(height: 30,),

                CustomInputField(
                  hintText: 'Apellido del usuario',
                  labelText: 'Apellido',
                  helperText: 'Solo letras',
                  icon: Icons.admin_panel_settings_outlined,
                  suffixIcon: Icons.group_outlined, 
                  formProperty: 'last_name', 
                  formValues: formValues,
                ), 

                const SizedBox(height: 30,),

                CustomInputField(
                  hintText: 'E-mail del usuario',
                  labelText: 'E-mail',
                  helperText: 'Solo letras',
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.admin_panel_settings_outlined,
                  suffixIcon: Icons.group_outlined, 
                  formProperty: 'email', 
                  formValues: formValues,
                ),   

                const SizedBox(height: 30),

                CustomInputField(
                  hintText: 'Contraseña del usuario',
                  labelText: 'Contraseña',
                  helperText: 'Solo letras',
                  icon: Icons.admin_panel_settings_outlined,
                  suffixIcon: Icons.group_outlined,
                  isPassword: true, 
                  formProperty: 'password', 
                  formValues: formValues,
                ),

                const SizedBox(height: 30),  

                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'superuser', child: Text('Superuser')),
                    DropdownMenuItem(value: 'developer', child: Text('Developer')),
                    DropdownMenuItem(value: 'jr_developer', child: Text('Jr. Developer')),
                  ],
                  onChanged: (value){
                    // print(value);
                    formValues['role'] = value ?? 'admin';
                  }),
                 
                ElevatedButton(
                  onPressed: (){
                    //Para guardar el teclado al apretar el botón
                    FocusScope.of(context).requestFocus(FocusNode());

                    if(!myFormKey.currentState!.validate()){
                      // print('Formulario no válido');
                    }
                    // print(formValues);
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Guardar')
                    )
                  )
                )          
              ]
            ),
          )
        )
      )
    );
  }
}
