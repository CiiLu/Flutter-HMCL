import 'package:flutter/material.dart';

class MinecraftInstallPage extends StatefulWidget {
  final VoidCallback onBack;

  const MinecraftInstallPage({super.key, required this.onBack});

  @override
  State createState() => _MinecraftInstallPageState();
}

class _MinecraftInstallPageState extends State<MinecraftInstallPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              onPressed: widget.onBack,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
