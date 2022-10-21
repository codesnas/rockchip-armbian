# Armbian for Rockchip / 瑞芯微·岸边

查看英文说明 | [View English description](README.md)

当前支持 Rock5b 设备，使用 [unifreq's](https://github.com/unifreq) 的加强版 `bootloader` 和 最新版本的 [Rock5b 专用内核](https://github.com/unifreq/linux-rock5b) 进行了重制。添加了在 [amlogic-s9xxx-armbian](https://github.com/ophub/amlogic-s9xxx-armbian) 项目中开发的更多应用和服务，支持写入 `TF/USB/eMMC/NVME` 中使用。

最新版固件可以在 [Releases](https://github.com/ophub/rockchip-armbian/releases) 中下载。

## 安装和更新方法

使用 [Rufus](https://rufus.ie/) 或者 [balenaEtcher](https://www.balena.io/etcher/) 等工具将固件写入 TF/USB 里，然后把写好固件的 TF/USB 插入设备。

- ### 安装 Armbian

如果你使用 `NVME` 或 `USB` 使用 Armbian 系统，必须下载这里提供的 [spi bootloader](build-armbian/u-boot/rock5b) 文件。[刷写方法](https://wiki.radxa.com/Rock5/install/spi)参照官方的说明。

登录 Armbian 系统 (默认用户: root, 默认密码: 1234) → 上传 Armbian 镜像 → 输入命令：

```yaml
dd if=armbian.img  of=/dev/<your_device_name>  bs=1M conv=fsync

# 例如，写入 NVME 的命令:
# dd if=armbian.img  of=/dev/nvme0n1  bs=1M conv=fsync
```

- ### 更新 Armbian 内核

登录 Armbian 系统 → 输入命令：

```yaml
# Run as root user (sudo -i)
# If no parameter is specified, it will update to the latest version.
armbian-update
```
如果当前目录下有成套的内核文件，将使用当前目录的内核进行更新（更新需要的 4 个内核文件是 `header-xxx.tar.gz`, `boot-xxx.tar.gz`, `dtb-rockchip-xxx.tar.gz`, `modules-xxx.tar.gz`。其他内核文件不需要，如果同时存在也不影响更新，系统可以准确识别需要的内核文件）。如果当前目录没有内核文件，将从服务器查询并下载同系列的最新内核进行更新。你也可以查询[可选内核](https://github.com/ophub/kernel/tree/main/pub/rock5b)版本，进行指定版本更新：`armbian-update 5.10.100`。在设备支持的可选内核里可以自由更新，如从 5.10.100 内核更新为 5.15.50 内核。

- ### 更多使用说明

将本地系统中的全部服务脚本更新到最新版本，可以登录 Armbian 系统 → 输入命令：

```yaml
armbian-sync
```

Armbian 固件的本地制作方法，使用 GitHub Actions 云编译的方法，以及更多应用服务的使用方法，在 [amlogic-s9xxx-armbian](https://github.com/ophub/amlogic-s9xxx-armbian) 项目中有详细说明。在使用 Armbian 系统的过程中，一些常见问题可以查看 [armbian-docs](https://github.com/ophub/amlogic-s9xxx-armbian/tree/main/build-armbian/armbian-docs)

## Armbian 固件默认信息

| 名称 | 值 |
| ---- | ---- |
| 默认 IP | 从路由器获取 IP |
| 默认账号 | root |
| 默认密码 | 1234 |

## 使用 GitHub Actions 编译内核

内核的编译方法详见 [compile-kernel](https://github.com/ophub/amlogic-s9xxx-armbian/tree/main/compile-kernel)

```yaml
- name: Compile the kernel
  uses: ophub/amlogic-s9xxx-armbian@main
  with:
    build_target: kernel
    kernel_repo: unifreq/linux-rock5b
    kernel_version: 5.10.100
    kernel_auto: true
    kernel_config: compile-kernel/config
    kernel_sign: -yourname
```

## 其他发行版

- [amlogic-s9xxx-armbian](https://github.com/ophub/amlogic-s9xxx-armbian) 项目提供了在晶晨系列盒子里使用的 `Armbian` 系统，欢迎使用。
- [amlogic-s9xxx-openwrt](https://github.com/ophub/amlogic-s9xxx-openwrt) 项目提供了在晶晨系列盒子里使用的 `OpenWrt` 系统，欢迎使用。
- [unifreq](https://github.com/unifreq/openwrt_packit) 为晶晨、瑞芯微和全志等更多盒子制作了 `OpenWrt` 系统，属于盒子圈的标杆，推荐使用。

## 链接

- [armbian](https://github.com/armbian/build)
- [Armbian for Amlogic](https://github.com/ophub/amlogic-s9xxx-armbian)
- [unifreq](https://github.com/unifreq)
- [kernel.org](https://kernel.org)

## License

The rockchip-armbian © OPHUB is licensed under [GPL-2.0](https://github.com/ophub/rockchip-armbian/blob/main/LICENSE)

