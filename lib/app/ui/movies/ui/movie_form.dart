import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
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
                const SizedBox(height: 16),
                ValueListenableBuilder<XFile?>(
                  valueListenable: controller.imageNotifier,
                  builder: (context, file, child) {
                    return Column(
                      children: [
                        const Text(
                          'Imagem (opcional)',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => controller.pickImage(),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: file == null
                                ? const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.photo_library,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Toque para escolher a imagem da galeria',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(file.path),
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                  onPressed: () async {
                    final formState = _formKey.currentState;
                    if (formState != null && formState.validate()) {
                      formState.save();
                      try {
                        await controller.saveMovie();
                        controller.imageNotifier.value = null;
                        Get.snackbar(
                          'Sucesso',
                          'Filme adicionado com sucesso!',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        Get.back();
                      } catch (e) {
                        Get.snackbar(
                          'Erro',
                          'Erro ao salvar filme: $e',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
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
                ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}
