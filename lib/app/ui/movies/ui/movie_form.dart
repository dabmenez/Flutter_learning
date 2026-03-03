import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/movies_controller.dart';

class MovieForm extends GetView<MoviesController> {
  MovieForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicione um novo filme'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome do filme',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o nome do filme';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.movieForm['title'] = value ?? '';
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe a descrição';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.movieForm['description'] = value ?? '';
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Diretores',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe os diretores';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.movieForm['directors'] = value ?? '';
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Sinopse',
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe a sinopse';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.movieForm['synopsis'] = value ?? '';
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    final formState = _formKey.currentState;
                    if (formState != null && formState.validate()) {
                      formState.save();
                      print(controller.movieForm);
                      Get.snackbar(
                        'Sucesso',
                        'Filme adicionado com sucesso!',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      Get.back();
                    } else {
                      Get.snackbar(
                        'Erro',
                        'Preencha os campos obrigatórios',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
