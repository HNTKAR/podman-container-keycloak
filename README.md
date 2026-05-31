# podman-container-keycloak

```bash
cd /PATH/TO/podman-container-keycloak
./replace.sh
mkdir -p ~/.config/containers/systemd
cp tmp/p-* ~/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user restart pc-keycloak
```
