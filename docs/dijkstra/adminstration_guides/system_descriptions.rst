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

.. note::

   The 30 TB shared storage is an NFS mount that contains the home
   directory of all users. Each node has its own local storage which
   contains the system application (e.g., OS, kernel, etc) specific to
   that node.

Login Node Hardware
===================

This datasheet describes the hardware availible on the *login* node.
While this machine is capable of executing software, it is primarily
intended as the point of access to the CPU and GPU nodes. The hostname
of this device is ``login``.

The login node is a SuperMicro SuperServer 6029P-TRT 2U server. The
datasheet from the vendor can be accessed at this url:
https://www.supermicro.com/products/system/2U/6029/SYS-6029P-TRT.cfm

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

The CPU compute nodes are SuperMicro SuperServer SYS-6029TP-HTR 2U
servers. The datasheet from the vendor can be accessed at this url:
https://www.supermicro.com/en/products/system/2u/6029/sys-6029tp-htr.cfm

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
intention.

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

.. csv-table:: Login Node System Software Datasheet
   :align: left
   :file: ./datasheets/system_software_description_login_node.csv

CPU Compute Node Software
=========================

.. csv-table:: CPU Compute Node System Software Datasheet
   :align: left
   :file: ./datasheets/system_software_description_cpu_node.csv

GPU Compute Node Software
=========================

.. csv-table:: GPU Compute Node System Software Datasheet
   :align: left
   :file: ./datasheets/system_software_description_gpu_node.csv
