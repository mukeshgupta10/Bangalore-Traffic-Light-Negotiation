# Traffic Light Negotiation & Perception — Bangalore Version
**Project:** Traffic Light Negotiation and Perception‑Based Detection (Bangalore adaptation)
**Prepared for:** College submission
**Author:** (Replace with your name)
**USN / Roll / Batch:** (Replace as required)

## Overview
This is an original MATLAB-based implementation inspired by traffic light negotiation projects.
It includes:
- MATLAB simulation harness (2D kinematic simulation)
- Perception module (traffic light detection using image processing)
- Decision controller (state-machine implemented in MATLAB)
- Utilities and example configuration for Bangalore-style intersections
- Report (report.md) and presentation skeleton (presentation_notes.md)

## Contents
- `scripts/` : Main MATLAB scripts (run `main_simulation.m`)
- `data/` : Placeholders for camera images and sample logs. Add real images from Bangalore intersections (see suggestions).
- `report.md` : Project report you can convert to PDF/docx.
- `presentation_notes.md` : Slide-by-slide notes to make a PPTX.
- `README.md` : This file.

## Requirements
- MATLAB R2019a or later recommended
- Optional toolboxes: Computer Vision Toolbox, Image Processing Toolbox
- (No Simulink `.slx` is included — this is a MATLAB-script prototype you can convert to Simulink later.)

## How to run (quick)
1. Open MATLAB and set the project folder to this repository root.
2. Put sample intersection images in `data/images/` (named `img_01.jpg`, `img_02.jpg`, ...)
3. Run `scripts/main_simulation.m` in MATLAB.
4. Review outputs in `data/output/` (detection logs, plots).

## Bangalore customizations included
- Intersection config files for common Bangalore intersections (Koramangala, MG Road placeholders).
- Typical signal timing suggestions used in the controller.
- Notes on local vehicle behaviour (two-wheelers filtering, auto-rickshaw stops).

## Academic integrity
This project is original code provided for educational use. Replace author details and make any further customizations required by your college.

--- End of README
