# TWRP Device configuration for Motorola Moto G Power 2021

## Device specification

Basic   | Spec Sheet
-------:|:------------------------
CPU     | Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)
CHIPSET | Qualcomm SDM665 (SM6115 "Bengal") Snapdragon 662
GPU     | Adreno 610
Memory  | 4GB
Shipped Android Version | 10.0
Storage | 64GB
Battery | 5000 mAh
Dimensions | 165.3 x 75.9 x 9.5 mm
Display | 720 x 1600 pixels, 20:9 ratio
Rear Camera  | 48 MP, f/1.7, 26mm (wide), 1/2.0", 0.8µm, PDAF + 2 MP, f/2.4, (macro), AF + 2 MP, f/2.4, (depth)
Front Camera | 8 MP, 1.12µm

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g9-power-2021-1.jpg)


### Kernel Source
Check here:

not yet


### How to compile

```sh
. build/envsetup.sh
export LC_ALL=C
lunch twrp_borneo-eng
mka -jX clobber && mka -jX recoveryimage
```
Note: 'X' in `mka -jX recoveryimage` is the number of cores your processor has.
For example, a quad-core processor would have `mka -j4 recoveryimage` as the command.

### Copyright
 ```
  /*
  *  Copyright (C) 2013-21 The OmniROM Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
