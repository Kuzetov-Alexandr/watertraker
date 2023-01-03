import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/utils/extension.dart';
import 'package:watertraker/utils/style.dart';



class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    this.data,
    required this.child,
  });
  final String? data;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        color: Colors.blueGrey.shade100,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          if (data != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24.0),
                  ),
                ),
                color: Colors.white,
              ),
              child: Text(
                data ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff33E34F),
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }
}

class ToggleData {
  ToggleData({
    required this.name,
    this.isDefault = false,
  });

  final bool isDefault;
  final String name;
}

enum ToggleAlignment { vertical, horizontal }

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({
    super.key,
    this.listData = const [],
    this.height = 32,
    this.width = double.infinity,
    this.alignment = ToggleAlignment.horizontal,
  });

  final ToggleAlignment alignment;
  final List<ToggleData> listData;
  final double width;
  final double height;

  @override
  State<MyToggleButton> createState() => MyToggleButtonState();
}

class MyToggleButtonState extends State<MyToggleButton> {
  late List<bool> switcherHorizont;

  @override
  void initState() {
    super.initState();
    switcherHorizont = widget.listData.map((e) => e.isDefault).toList();
  }

  Widget _buildLayout(List<Widget> a) {
    if (widget.alignment == ToggleAlignment.vertical) {
      return Column(
        children: a,
      );
    } else {
      return Row(
        children: a,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayout(
      widget.listData
          .mapIndexed(
            (i, e) => Padding(
              padding: EdgeInsets.only(
                top: i != 0 && widget.alignment == ToggleAlignment.vertical
                    ? 10
                    : 0,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  foregroundColor: switcherHorizont[i]
                      ? const MaterialStatePropertyAll(Colors.white)
                      : MaterialStatePropertyAll(Colors.blue.shade200),
                  minimumSize: widget.alignment == ToggleAlignment.horizontal
                      ? MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        )
                      : MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        ),
                  maximumSize: widget.alignment == ToggleAlignment.horizontal
                      ? MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        )
                      : MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        ),
                  backgroundColor: switcherHorizont[i]
                      ? const MaterialStatePropertyAll(Color(0xff0148FF))
                      : const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  switcherHorizont[i] = true;
                  for (int j = 0; j < switcherHorizont.length; j++) {
                    if (j != i) {
                      switcherHorizont[j] = false;
                    }
                  }
                  setState(() {});
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    e.name,
                    textAlign: widget.alignment == ToggleAlignment.vertical
                        ? TextAlign.start
                        : TextAlign.center,
                    style: MyStyle.styleTextSmall,
                  ),
                ),
              ),
            ),
          )
          .insertSeparator(
            const SizedBox(
              width: 10,
            ),
          )
          .map(
            (e) => e is SizedBox || widget.alignment == ToggleAlignment.vertical
                ? e
                : Expanded(child: e),
          )
          .toList(),
    );
  }
}