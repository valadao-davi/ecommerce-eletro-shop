import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/tela_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatefulWidget {
  Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  

  final nomeController = TextEditingController();

  final emailController = TextEditingController();

  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Cadastro", style: TextStyle(fontSize: 18),),
            ),
            SizedBox( height: 16),
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Insira seu nome completo',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox( height: 8),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Insira seu email',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Crie sua senha',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: ()  {
              UserModel userl = UserModel(
                  email: emailController.text, 
                  senha: senhaController.text,
                  username: nomeController.text,
                  gerente: false
                  );
                provider.cadastrarUsuario(context,userl);
             
            }, child: const Text('Cadastrar')),
            SizedBox(height: 8),
            GestureDetector(
              onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginInicial()),
                 );
              },
              child: SizedBox(
                width: 140,
                child: Text("Já tem uma conta? Faça o login!", textAlign: TextAlign.center,)),
            )

          ],
        ),
      ),
    );
  }
}