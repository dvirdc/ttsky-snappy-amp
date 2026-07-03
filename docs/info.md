<!---
This file is used to generate your project datasheet. Please fill in the information below
and delete any unused sections.
-->

## How it works

This is a **common-source NMOS amplifier** in sky130, with a twist: the input
AC-coupling capacitor **is the Snappy logo**. The 3.51 pF coupling capacitor is built as
a mosaic of 195 unit MiM capacitors (`sky130_fd_pr__cap_mim_m3_1`) placed only where the
Snappy silhouette is "on", all wired in parallel between two plates — so the on-chip
artwork is a fully functional, LVS-clean capacitor.

Circuit:
- **M1** — `sky130_fd_pr__nfet_01v8`, W = 4 µm, L = 0.5 µm, 2 fingers.
- **R1 = 600 k, R2 = 400 k** — on-chip poly (`res_xhigh_po`) bias divider setting the gate
  at ~0.72 V from VDPWR.
- **RD = 20 k** — drain load; **RS = 1 k** — source degeneration.
- **Cin = 3.51 pF** — the Snappy-logo MiM capacitor, coupling `vin` to the gate.

Operating point (real sky130 models, tt corner): vg ≈ 0.72 V, vout ≈ 1.6 V, Id ≈ 9 µA;
midband voltage gain ≈ 1.7×, input high-pass corner ≈ 180 kHz.

## How to test

1. Power the chip (VDPWR = 1.8 V).
2. Apply a small AC signal (e.g. 10 mVpp sine, 200 kHz–1 MHz) to **ua[0]** (vin).
3. Observe the amplified, inverted output on **ua[1]** (vout), biased around ~1.6 V.
4. Sweep frequency to see the high-pass roll-off below ~180 kHz (set by the Snappy cap).

Keep the source impedance low and the load light (high-impedance scope probe); the analog
pins allow < 500 Ω / < 5 pF.

## External hardware

- A signal generator on ua[0] and an oscilloscope on ua[1].
- 1.8 V supply on VDPWR.
No other external components are required (bias and load are on-chip).
