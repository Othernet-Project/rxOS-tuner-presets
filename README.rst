overlay-presets
===============

This repository contains scripts for creating and maintainig Libarian tuner 
presets overlay. This overlay is a small SquashFS image containing a single
python module with tuner presets. By keeping the presets separate, it can be
updated OTA without having to ship an entire rootfs image or even just the
librarian.

Prerequisites
-------------

To create the overlay, you will need squashfs-tools.

Creating the overlay
--------------------

To create the overlay, run ``make``. This creates ``overlay-presets.sqfs``
SquashFS image in the source directory.

Updating the presets
--------------------

Presets can be updated from Librarian's GitHub repository::

    make update
