

MOJO
====

----
NOTE: The code within this repo is being merged with the FPGA repo. There was such little development within this repo, losing the version control shouldn't be an issue. Keep the "Mojo" repo within Git for a little while until certain that this directory can be removed. The following directories:
* avionics
* sandbox
* template
* util
are ported over the 'legacy' directory with the 'FPGA' repo.
----

Source code for FPGA, written in Verilog, for the Spartan-6 chip, on the Mojo development board.


Development Path
----------------

The goal of Version0, is to have all of the components needed to 
develop an avionics solution from FPGA hardware.

<ul>

<li> V0.3 - Connect IMU sensor </li>
<ul>
  <li> Established SPI communication for IMU. </li>
  <li> Display results on terminal. </li>
  <li> WIP </li>
  <li> Add setup configuration to FSM. </li>
  <li> Read register values. </li>
  <li> Setup floating point arithmetic core. </li>
  <li> Scale reg outputs into floating point values. </li>
  <li> Implement low-pass filters. </li>
  <li> FUTURE WORK </li>
  <li> Configure magnetometer </li>
  <li> Run Acc/Gyr self test </li>
  <li> Assign offsets </li>
  <li> FIFO counting. </li>
</ul>

<li> V0.4 - SD card data logging </li>
<ul>
  <li> Setup MicroBlaze soft processor core. </li>
  <li> Connect SD card with serial communication. </li>
  <li> Store data locally on internal register. </li>
  <li> Add data logging commands to FSM. </li>
  <li> C code to handle file system operations. </li>
  <li> Transfer internal data to SD card. </li>
</ul>

<li> V0.5 - Complementary filter solution </li>
<ul>
  <li> Setup trigonometry core. </li>
  <li> Calculate summation of rate gyro values. </li>
  <li> Tangent function on accelerometer values. </li>
  <li> Weighted average of two signals. </li>
  <li> Display results on terminal. </li>
</ul>

<li> V0.6 - Attitude Heading and Reference System (AHRS) </li>
<ul>
  <li> Convert C code implementation into HDL. </li>
  <li> Display results on terminal. </li>
  <li> Store results within data log files. </li>
</ul>

<li> V0.7 - PID feedback control loop </li>
<ul>
  <li> Implement for standard fixed-wing aircraft. </li>
  <li> PID on SISO roll axis. </li>
  <li> PID on SISO pitch axis. </li>
  <li> PID on SISO yaw axis. </li>
  <li> Display results on terminal. </li>
  <li> Store results within data log files. </li>
</ul>

<li> V0.8 - Ground Control Station (GCS) </li>
<ul>
  <li> Develop FSM for Mavlink protocol. </li>
  <li> Setup UART comminication through XBee radios. </li>
  <li> Send heartbeat messages. </li>
  <li> Transmit vehicle inputs, outputs, and states. </li>
  <li> Load custom parameter file. </li>
  <li> Adjust PID settings remotely. </li>
</ul>

<li> V0.9 - Extended Kalman Filter (EKF) </li>
<ul>
  <li> Setup linear algebra core. </li>
  <li> Start with single DOF merge of comp filer and AHRS. </li>
  <li> Graduate to 3DOF solution for vehicle attitude. </li>
  <li> Extend to a full 6DOF representation with position. </li>
  <li> Display results to terminal. </li>
  <li> Store results within data log files. </li>
</ul>

</ul>




V0.2 - Connect inputs and outputs
---------------------------------
<ul>
  <li> Added 8CH radio inputs. </li>
  <li> Added 8CH ESC outputs. </li>
  <li> Established stick commands for arming, data logging, etc. </li>
  <li> Default signal outputs while motors are disarmed. </li>
  <li> Direct pass input/output mapping once armed. </li>
</ul>




V0.1 - New Project /w Debug Terminal
------------------------------------------
<ul>
  <li> Setup initial 'Util' modules. </li>
  <li> Started with mojo development board template. </li>
  <li> Renamed files for avionics project. </li>
  <li> Demonstrated working hardware through LEDs. </li>
  <li> Developed basic states for avionics board. </li>
  <li> Configured internal clocks and timers. </li>
  <li> Established counter for timestamp. </li>
  <li> Converted timestamp to ASCII serial data. </li>
  <li> Displayed system time on terminal screen. </li>
  <li> Reading input commands from keyboard. </li>
</ul>




