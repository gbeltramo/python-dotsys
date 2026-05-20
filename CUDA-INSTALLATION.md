# CUDA 13 installation

## General Documentation 
- [Prerequisistes on Debian](https://wiki.debian.org/NvidiaGraphicsDrivers) 
- [CUDA on Linux](https://docs.nvidia.com/cuda/cuda-installation-guide-linux)

## Prerequisites
Debian 13 packages

```shell
# In /etc/apt/sources.list
# Add contrib non-free everywhere
# E.g.  =>  deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
sudo apt update

# Note: driver prerequisites
sudo apt install linux-headers-$(uname -r)
```

## Nvidia Driver from Nvidia repo
Add the CUDA NVIDIA repository to `apt` sources

```shell
wget https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
```

Pin version `595`

```shell
sudo apt install nvidia-driver-pinning-595
sudo apt install nvidia-kernel-open-dkms nvidia-kernel-support nvidia-driver nvidia-driver-cuda

# Note: check driver installation
sudo reboot
nvidia-smi
sudo apt install nvtop

# Note: for CUDA toolkit
sudo apt install cuda-toolkit-13-2

sudo reboot
```

## Nvidia Driver from Debian repos

```shell
# Note: on Debian 13 this will install version 550
sudo apt install nvidia-driver nvidia-kernel-open-dkms

# Note: check driver installation
sudo reboot
nvidia-smi
sudo apt install nvtop
```
