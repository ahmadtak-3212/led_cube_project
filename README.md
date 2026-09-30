# led_cube (formerly "galina")

_TODO: one-line description._ LED cube: V1 driven from an FPGA (SystemVerilog LED driver, PWM, testbenches), V2 on a custom PCB with an ATmega328 (Arduino/PlatformIO), 3D-printed/CNC/laser parts and a soldering jig.

## Status

| Area | Status |
|---|---|
| Mechanical | Done |
| Electrical | Done (V2 PCB routed, Gerbers) |
| FPGA | Done (V1 Vivado project + bitstreams) |
| Firmware | Done (V2) |

## What's here

| Folder | Contents |
|---|---|
| `docs/` | Datasheets, reports, photos — `images` |
| `mechanical/` | CAD (native + exports), CAM — `cad`, `cam`, `exports` |
| `electrical/` | KiCad board projects, circuit sims — `led_cube_pcb` |
| `firmware/` | MCU firmware projects — `led_cube_firmware` |
| `fpga/` | Vivado / Vitis / PetaLinux — `led_cube_v1` |

See [docs/STRUCTURE.md](docs/STRUCTURE.md) for the layout conventions.

## Build / run

_TODO: tools + versions, and the steps to rebuild or reproduce._

## Results

_TODO: what worked, measurements, photos._
