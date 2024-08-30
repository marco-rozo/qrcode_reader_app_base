import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/core/theme/components/custom_button.dart/custom_button.dart';
import 'package:code_bar_reader_base/core/theme/components/custom_snackbar/custom_snackbar.dart';
import 'package:code_bar_reader_base/core/theme/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComponentsPage extends StatefulWidget {
  const ComponentsPage({super.key});

  @override
  State<ComponentsPage> createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> with CustomSnackBar {
  final _sizedBox = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Buttons'),
            _sizedBox,
            CustomButton.primary(text: 'primary', onPressed: () {}),
            _sizedBox,
            CustomButton.secondary(text: 'secondary', onPressed: () {}),
            _sizedBox,
            CustomButton.negative(text: 'negative', onPressed: () {}),
            _sizedBox,
            const Text('Alerts'),
            CustomButton.secondary(
              text: 'show snackbar',
              onPressed: () {
                showCustomSnackBar(context, message: "Uma snackBar");
              },
            ),
            _sizedBox,
            const Text('Text Fields'),
            _sizedBox,
            SoftTextFormField(
              hintText: 'hint text',
              onChanged: (value) {},
              textEditingController: TextEditingController(),
            ),
            _sizedBox,
            const Text('Scanner test'),
            _sizedBox,
            CustomButton.primary(
              text: 'Go to scanner',
              onPressed: () => context.pushNamed(AppNamedRoutes.ticketScanner),
            ),
          ],
        ),
      ),
    );
  }
}
