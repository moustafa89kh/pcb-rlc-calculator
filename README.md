# pcb-rlc-calculator
🔍 Purpose of the Script To calculate lumped R, L, C, and Z values of a PCB trace based on:  Trace geometry (width, height, thickness)  Material properties (copper resistivity, temperature coefficient, permittivity)  Trace type: microstrip or stripline
# PCB RLC Calculator (Microstrip / Stripline)

This MATLAB script calculates the lumped R, L, and C parameters as well as characteristic impedance (Z) for PCB traces modeled as microstrip or stripline.

## Features

- Supports both microstrip and stripline models
- Calculates R (mΩ), L (nH), C (pF), and Z (Ω)
- Input parameters: geometry, material, and temperature
- Includes geometric validity checks

## Limitations

- Valid under 1 GHz
- Skin effect, copper roughness, and loss tangent are **not** included
- Empirical formulas are valid within these limits:
  - Microstrip: `W/H < 7.475 - 1.25*(T/H)`
  - Stripline: `W/B < 2.375 - 1.25*(T/B)`

## Usage

Edit `pcb_rlc_calculator.m` to input your trace geometry and material parameters. Run the script in MATLAB or Octave.

## Author

Adapted from script by Aleksandr Sidun [AnalogHub.ie](https://analoghub.ie)

## License

MIT
