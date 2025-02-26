______________________________________________________________________

## tags: ["AI","ML","Machine Learning", "GPGPU"] title: "Durian GPGPU Server" linktitle: "Durian GPGPU Server" date: 2017-01-05 description: > Getting started with the Durian GPGPU from Lambda Systems.

{{% pageinfo %}}

This page needs improvement.

{{% /pageinfo %}}

The CS and Mathematics departments subscribe to Google Apps for Your

# GPGPU Server

1. After you log in the server, please run the following command to install the
   SDK in your home directory:

   ```
   $ cp_gpusdk
   ```

   This will result in a folder being created in ~/NVIDIA_GPU_Computing_SDK,

1. Compiling the examples:

   ```
   $ cd ~/NVIDIA_GPU_Computing_SDK/C
   $ make
   ```

1. Run the `deviceQuery` demo to see the GPGPU device(s).

   ::: literalinclude devicequery.txt :::

1. See
   <http://developer.download.nvidia.com/compute/cuda/3_2/docs/Getting_Started_Linux.pdf>
   for additional details.
