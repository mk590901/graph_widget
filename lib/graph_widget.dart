import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'drawing_bloc.dart';
import 'obtained.dart';
import 'path_painter.dart';
import 'states/drawing_state.dart';
import 'store_wrapper.dart';
import 'package:uuid/uuid.dart';

class GraphWidget extends StatelessWidget /*implements ICounterUpdater*/ {

  final int samplesNumber;
  final double width;
  final double height;
  final String uuid = const Uuid().v4().toString();

  bool _startStop = false;

  late StoreWrapper storeWrapper;

  final Obtained obtain = Obtained.part(const Duration(milliseconds: 24));

  GraphWidget({super.key, required this.samplesNumber, required this.width, required this.height}) {
    storeWrapper = StoreWrapper(samplesNumber, 5, 6);
  }

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<DrawingBloc>(
      create: (_) => DrawingBloc(DrawingState(DrawingStates.drawing)),
      //lazy: false,
      child: GestureDetector(
        onTap: () {
          _startStop = !_startStop;
          if (_startStop) {
            obtain.start(uuid);
          }
          else {
            obtain.stop(uuid);
          }
        },
        child:
          BlocBuilder<DrawingBloc, DrawingState>(builder: (context, state) {

          obtain.set(storeWrapper.drawingFrequency(), context);
          storeWrapper.updateBuffer(state.counter());

          return SizedBox(
            width: width,
            height: height,
            child: CustomPaint(
              painter: PathPainter.graph(state.counter(), storeWrapper),
            ),
          );
        }),
      ),
    );
  }
}
