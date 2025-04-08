import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key, required this.onChange, required this.genre});
  final void Function(String?) onChange;
  final String? genre;
  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedGenre;

  @override
  void initState() {
    selectedGenre = widget.genre;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.scaffoldBGColor,
      title: Text('Select Genre', style: AppTextStyles.appBarTextStyle),
      content: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.25,
        child: SingleChildScrollView(
          child: Column(
            children:
                genreNames.map((String? genre) {
                  return RadioListTile<String>(
                    fillColor: WidgetStatePropertyAll(AppColors.primaryColor),
                    groupValue: selectedGenre ?? 'No Genre',
                    title: Text(
                      genre ?? 'No Genre',
                      style: AppTextStyles.regularTextStyle,
                    ),
                    value: genre ?? 'No Genre',
                    onChanged: (String? value) {
                      setState(() {
                        selectedGenre = value;
                        if (selectedGenre == 'No Genre') {
                          widget.onChange(null);
                        } else {
                          widget.onChange(selectedGenre);
                        }
                      });
                    },
                  );
                }).toList(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok', style: AppTextStyles.regularTextStyle),
        ),
      ],
    );
  }
}
