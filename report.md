# Project Report — Traffic Light Negotiation & Perception (Bangalore)

## 1. Introduction
Objective: Build an autonomous-agent prototype that negotiates traffic lights using camera perception and a decision controller. The Bangalore variation adds real-world considerations: two-wheeler filtering, auto-rickshaw behaviour, varied signal timings, and occlusions from trees/advertisements.

## 2. System Architecture
- **Perception:** Image-based traffic-light detection (color + geometry).
- **Localization:** Vehicle pose in 2D (simulated).
- **Controller:** Finite-state machine (Stop, Prepare, Go, Follow).
- **Simulator:** 2D kinematic vehicle model (MATLAB script).

## 3. Implementation
See `scripts/` for detailed code:
- `main_simulation.m` — orchestrates simulation, perception calls and controller decisions.
- `perception_detectTrafficLight.m` — detects traffic light bounding box and state (red/yellow/green).
- `controller_state_machine.m` — decision logic using detected state and distance-to-stop-line.
- `utils_*` files — helper functions.

## 4. Dataset & Bangalore specifics
- Collect images at intersections such as Koramangala 5-way, MG Road, Junctions near Metro stations.
- Capture varied times of day and occlusions (buses, trees).
- Label images manually (tips included in `data/README_images.txt`).

## 5. Experiments & Results
(Copy your results here after running tests: detection accuracy, stop distance error, false positives)

## 6. Extensions & Future Work
- Integrate with Simulink / Unreal scenes (if available).
- Add LIDAR/radar fusion.
- Train a small CNN for robust traffic-light detection under occlusion.

## 7. Conclusion
This implementation serves as a college-ready submission. Replace placeholders, attach sample images and run experiments to fill metrics.
