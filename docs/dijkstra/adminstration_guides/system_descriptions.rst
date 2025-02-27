####################
 System Description
####################

.. note::

   The hardware and software system descriptions of Dijkstra are
   evolving. This list is accurate as of Feburary 26, 2025.

Dijkstra is the Loyola University Chicago (LUC) Computer Science
departments primary education and research cluster computer. It is
inately a *heterogenous* system with a mixture of systems from various
vendors.

Dijkstra is designed to provide both students and faculty a world class
educational tool; allowing users to learn how to program for a
high-performance computing environment, scale applications across many
devices, GPU programing, parallel programming, and Unix environement
navigation and management among others. For research faculty, Dijkstra
enables research scientists to leverage high core count CPUs and GPUs
for data analysis, testing, experimentation, and visualization.

Dijkstra is an ongoing research project. As such, the features and
capabilities of Dijkstra may fluctuate over time. This page is an
attempt at keeping an up to date record of the hardware and system
software of Dijkstra nodes.

**********************
 Hardware Description
**********************

The following hardware description defines the Dijkstra cluster *as a
whole*. Individual node descriptions are provided in relevant
subsections.

.. csv-table:: Dijkstra Cluster Hardware Datasheet
   :align: left
   :file: ./datasheets/system_description_cluster.csv

Login Node Hardware
===================

This datasheet describes the hardware availible on the *login* node.
While this machine is capable of executing software, it is primarily
intended as the point of access to the CPU and GPU nodes. The hostname
of this device is ``login``.

.. csv-table:: Login Node Hardware Datasheet
   :align: left
   :file: ./datasheets/system_description_login_node.csv

CPU Compute Node Hardware
=========================

This datasheet describes the hardware availible on the *CPU* compute
nodes. The hostnames of CPU compute nodes are denoted as ``node*`` where
``*`` is a value two (2) through fifteen (15) inclusive.

These nodes are our primary compute nodes and nearly all jobs should be
designed around these nodes.

.. csv-table:: CPU Compute Node Hardware Datasheet
   :align: left
   :file: ./datasheets/system_description_cpu_node.csv

GPU Compute Node Hardware
=========================

This datasheet describes the hardware availible on the *GPU* compute
nodes. The hostnames of GPU compute nodes are denoted as ``gpu*`` where
``*`` is a value one (1) through two (2) inclusive.

These nodes are our primary AI training, testing, and inference nodes.
While capable of executing CPU jobs on these nodes that is not their
intention. Users should consider CPU nodes prior to GPU nodes for CPU
job execution.

.. csv-table:: GPU Compute Node Hardware Datasheet
   :align: left
   :file: ./datasheets/system_description_gpu_node.csv

*****************************
 System Software Description
*****************************

*System software* refers to any software package that is handled by
system administration faculty and staff. This is not a complete software
bill of materials which is provided on a seperate page.

Login Node Software
===================

-  OS
-  Kernel
-  CPU driver
-  GPU driver

CPU Compute Node Software
=========================

-  OS
-  Kernel
-  CPU driver
-  GPU driver

GPU Compute Node Software
=========================

-  OS
-  Kernel
-  CPU driver
-  GPU driver
