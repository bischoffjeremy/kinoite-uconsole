# Fedora KDE — ClockworkPi uConsole (CM4)

A ready-to-flash KDE Plasma desktop image for the ClockworkPi uConsole with the
Raspberry Pi CM4. Stock uConsole kernel, everything wired up.

> Two editions are planned: **Plain** (regular, writable Fedora — available now)
> and **Atomic** (immutable Fedora Kinoite with rollback — work in progress).

## Download

Two editions, pick one:

| Edition | What it is | Download |
|---|---|---|
| **Plain — Fedora 44 KDE** | Regular, **writable** Fedora. Normal `dnf`, your files persist. Easiest to use. | [**⬇ fedora-kde-uconsole-cm4.img.gz**](https://pub-728b0a04c49649fc9d4dd17c95a7bf21.r2.dev/fedora-kde-uconsole-cm4.img.gz) |
| **Atomic — Fedora Kinoite** | **Immutable** OS with atomic updates + rollback (ostree, u-boot). For a robust, self-healing system. | [**⬇ kinoite-uconsole-cm4.img.gz**](https://pub-728b0a04c49649fc9d4dd17c95a7bf21.r2.dev/kinoite-uconsole-cm4.img.gz) |

Not sure? Take **Plain**.

## Flash

Use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or
[Balena Etcher](https://etcher.balena.io/) — both read `.img.gz` directly, no
unpacking needed:

1. Open the flasher and select the downloaded `fedora-kde-uconsole-cm4.img.gz`.
2. Choose your microSD card.
3. Flash.

## First boot

Put the card in the uConsole and power on. It boots to the KDE login screen.

**Login:** user `uconsole`, password `uconsole` (change it after first login).

Display, keyboard, trackball, Wi-Fi, Bluetooth, battery, brightness and speaker
work out of the box.

## LTE / 4G

The 4G modem (ClockworkPi 4G expansion) is **off by default**, exactly like
ClockworkPi's own OS — you switch it on when you need it:

```bash
sudo uconsole-4g enable     # power the modem on (takes ~20s)
mmcli -L                    # the modem should now be listed
```

Then create the mobile-broadband connection with your SIM's APN — in KDE's
network settings, or with `nmcli`. To power it off again:

```bash
sudo uconsole-4g disable
```

Requires the 4G expansion module to be fitted.

## Build it yourself

Images are built in GitHub Actions on native ARM64 runners — push to `main` or
run the **Build uConsole CM4** workflow manually.
