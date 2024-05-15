# Stateless (BLoC) widget for visualization ECG

The project implements a widget for dynamic visualization of constantly incoming ECG data

## Introduction

The project is a corrected version of the application https://github.com/mk590901/custom_widget_painter.

## Refactoring

The project has been refactored. Two rendering modes have been introduced: _overlap_ and _flowing_. The first corresponds to drawing an overlay of a new image on the old one, the second to adding new points to the old ones and creating the effect of a “driving” trend. The mode is added to the constructor of widget.

## Movie

https://github.com/mk590901/graph_widget/assets/125393245/b13e4bf7-10f9-4386-8b51-eac153900ebe



