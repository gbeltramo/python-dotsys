# CUDA 13 installation

## Docs
- [Prerequisistes on Debian](https://wiki.debian.org/NvidiaGraphicsDrivers) 
- [CUDA on Linux](https://docs.nvidia.com/cuda/cuda-installation-guide-linux)

## Prerequisites

Add the CUDA NVIDIA repository to `apt` sources

```shell
wget https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
```

Then install additional Debian 13 packages

```shell
# In /etc/apt/sources.list
# Add contrib non-free everywhere
# E.g.  =>  deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
sudo apt update

# Note: driver prerequisites
sudo apt install build-essential dkms linux-headers-$(uname -r)
```

## Nvidia Driver
Pin version `595`

```shell
sudo apt install nvidia-driver-pinning-595
sudo apt install nvidia-driver-cuda nvidia-kernel-open-dkms

# Note: check driver installation
sudo reboot
nvidia-smi
sudo apt install nvtop
```

## CUDA toolkit
```shell
# Note: for CUDA toolkit
sudo apt install cuda-toolkit-13-2

sudo reboot
```