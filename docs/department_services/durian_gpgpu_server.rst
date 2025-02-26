#####################
 Durian GPGPU Server
#####################

Getting started with the Durian GPGPU from Lambda Systems.

**************
 GPGPU Server
**************

#. After you log in the server, please run the following command to
   install the SDK in your home directory:

   .. code:: bash

      cp_gpusdk

   This will result in a folder being created in
   ``~/NVIDIA_GPU_Computing_SDK``.

#. Compiling the examples:

   .. code:: bash

      cd ~/NVIDIA_GPU_COMPUTING_SDK/C
      make

#. Run the ``deviceQuery`` demo to see the GPGPU device(s).

#. See
   http://developer.download.nvidia.com/compute/cuda/3_2/docs/Getting_Started_Linux.pdf
   for additional details.
