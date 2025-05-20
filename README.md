# PCB RLC Calculator (Microstrip / Stripline)

This MATLAB script calculates the lumped R, L, and C parameters as well as characteristic impedance (Z) for PCB traces modeled as microstrip or stripline.

## Features

- Supports microstrip and stripline
- Calculates resistance (R), inductance (L), capacitance (C), and characteristic impedance (Z)
- Includes validity checks for geometry

## Limitations

- Valid under 1 GHz
- Ignores:
  - Skin effect
  - Copper roughness
  - Loss tangent

### Geometry Validity Conditions:
- **Microstrip:** `W/H < 7.475 - 1.25*(T/H)`
- **Stripline:** `W/B < 2.375 - 1.25*(T/B)`

## Getting Started

### Requirements
- MATLAB or GNU Octave

### Usage
1. Open the file `pcb_rlc_calculator.m`
2. Modify input parameters to match your trace geometry
3. Run the script to see output in the console

### Example Output
PCB microstrip parameters (Length = 1.0 mm):
R = 0.987 mOhms
L = 0.593 nH
C = 0.215 pF
Z = 51.679 Ohms
