import 'package:flutter/material.dart';
import 'package:custom_qr_generator/custom_qr_generator.dart';

class WebSiteScreen extends StatefulWidget {
  const WebSiteScreen({super.key});

  @override
  _WebSiteScreenState createState() => _WebSiteScreenState();
}

class _WebSiteScreenState extends State<WebSiteScreen> {
  final TextEditingController textEditingController = TextEditingController();
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Website QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.web,
              color: Colors.orange,
              size: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'web',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter url',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrData = textEditingController.text;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Generate QR Code'),
            ),
            const SizedBox(
              height: 20,
            ),
            if (qrData != null)
              CustomPaint(
                size: const Size(200, 200),
                painter: QrPainter(
                  data: qrData!,
                  options: const QrOptions(
                    shapes: QrShapes(
                      darkPixel: QrPixelShapeRoundCorners(),
                      frame: QrFrameShapeRoundCorners(cornerFraction: 2),
                      ball: QrBallShapeRoundCorners(cornerFraction: 2),
                    ),
                    colors: QrColors(
                      dark: QrColorLinearGradient(
                        colors: [
                          Color(0xffD70060),
                          Color(0xffFF543E),
                        ],
                        orientation: GradientOrientation.vertical,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
