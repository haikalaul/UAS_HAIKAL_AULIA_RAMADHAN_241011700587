import 'package:flutter/material.dart';

class Pert8 extends StatefulWidget {
  const Pert8({super.key});

  @override
  State<Pert8> createState() => _Pert8State();
}

class _Pert8State extends State<Pert8> {
  final List<String> kota = [
    'Jakarta',
    'Bandung',
    'Depok',
    'Bogor',
    'Bekasi',
    'Surabaya',
    'Yogyakarta',
    'Semarang',
    'Medan',
    'Bali',
  ];

  String? selectedKota;
  String hasilAutocomplete = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pertemuan 8'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Autocomplete',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }

                return kota.where((String option) {
                  return option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },
              onSelected: (String selection) {
                setState(() {
                  hasilAutocomplete = selection;
                });
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: 'Cari Kota',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    );
                  },
            ),

            const SizedBox(height: 15),

            Text(
              'Hasil AutoComplete : $hasilAutocomplete',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            const Text(
              'Spinner / DropdownButton',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: selectedKota,
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text('Pilih Kota'),
                icon: const Icon(Icons.arrow_drop_down),
                items: kota.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedKota = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Kota Dipilih : ${selectedKota ?? '-'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
