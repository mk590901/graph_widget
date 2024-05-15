// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:graph_widget/circular_buffer.dart';
import 'package:graph_widget/graph_mode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graph_widget/store_wrapper.dart';

void main() {
  test('test_CircularBuffer', () {
    CircularBuffer<int> buffer_ = CircularBuffer<int>(5);
    expect(buffer_.capacity(),5);
    buffer_.writeRow([1,1]);
    expect(buffer_.size(),2);
    buffer_.writeRow([2,2]);
    expect(buffer_.size(),4);
  });

  test('test_StoreWrapper', () {
    StoreWrapper storeWrapper = StoreWrapper(3,3,2, GraphMode.overlay);
    CircularBuffer<int> buffer = storeWrapper.buffer();
    expect(buffer.capacity(),9);
    buffer.writeRow([1,1]);
    expect(buffer.size(),2);
    print(buffer.trace());

    bool full = buffer.isFull();
    int writeIndex = buffer.writeIndex();
    int readIndex = buffer.readIndex();
    int size = buffer.size();

    List<int> out = buffer.readRow(2);
    expect(out,[1,1]);
    expect(buffer.size(),0);

    print(buffer.trace());

    buffer.setFull(full);
    buffer.setWriteIndex(writeIndex);
    buffer.setReadIndex(readIndex);
    buffer.setSize(size);

    print(buffer.trace());

  });

  test('test_StoreWrapper_advance', () {
    StoreWrapper storeWrapper = StoreWrapper(3,3,2,GraphMode.overlay);
    CircularBuffer<int> buffer = storeWrapper.buffer();
    expect(buffer.capacity(),9);
    buffer.writeRow([1,1]);
    expect(buffer.size(),2);
    String before = buffer.trace();
    print(before);

    storeWrapper.storeCircularBufferParams();

    List<int> out = buffer.readRow(2);
    expect(out,[1,1]);
    expect(buffer.size(),0);

    print(buffer.trace());

    storeWrapper.restoreCircularBufferParams();

    String after = buffer.trace();

    expect(after, before);

    print(after);

  });

  test('test_StoreWrapper_getData', () {
    StoreWrapper storeWrapper = StoreWrapper(3,3,2,GraphMode.overlay);
    CircularBuffer<int> buffer = storeWrapper.buffer();
    expect(buffer.capacity(),9);

  //  1
    print ("1");

    buffer.writeRow([1,2]);
    expect(buffer.size(),2);
    String before = buffer.trace();
      storeWrapper.storeCircularBufferParams();
    List<int> outData = buffer.getData();
    expect(outData,[1,2]);
    print(buffer.trace());
      storeWrapper.restoreCircularBufferParams();
    String after = buffer.trace();
    expect(after, before);
    print(after);

  //  2
    print ("2");
    buffer.writeRow([3,4]);
    expect(buffer.size(),4);
    before = buffer.trace();
    storeWrapper.storeCircularBufferParams();
    outData = buffer.getData();
    expect(outData,[1,2,3,4]);
    print(buffer.trace());
    storeWrapper.restoreCircularBufferParams();
    after = buffer.trace();
    expect(after, before);
    print(after);

    // 3
    print ("3");
    buffer.writeRow([5,6]);
    expect(buffer.size(),6);
    before = buffer.trace();
    storeWrapper.storeCircularBufferParams();
    outData = buffer.getData();
    expect(outData,[1,2,3,4,5,6]);
    print(buffer.trace());
    storeWrapper.restoreCircularBufferParams();
    after = buffer.trace();
    expect(after, before);
    print(after);

    // 4
    print ("4");
    buffer.writeRow([7,8]);
    expect(buffer.size(),8);
    before = buffer.trace();
    storeWrapper.storeCircularBufferParams();
    outData = buffer.getData();
    expect(outData,[1,2,3,4,5,6,7,8]);
    print(buffer.trace());
    storeWrapper.restoreCircularBufferParams();
    after = buffer.trace();
    expect(after, before);
    print(after);

    // 5
    print ("5");
    buffer.writeRow([9,10]);
    expect(buffer.size(),8);
    before = buffer.trace();
    storeWrapper.storeCircularBufferParams();
    outData = buffer.getData();
    expect(outData,[3,4,5,6,7,8,9,10]);
    print(buffer.trace());
    storeWrapper.restoreCircularBufferParams();
    after = buffer.trace();
    expect(after, before);
    print(after);

  });

}
