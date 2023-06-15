## External monitor not rotated
# -xrandr --output eDP-1 --scale 0.4999x0.4999
# -xrandr --output "HDMI-1" --scale 0.9999x0.9999

## External monitor rotated right
xrandr --output eDP-1 --scale 0.8749x0.8749 --right-of "HDMI-1"
xrandr --output "HDMI-1" --scale 0.9999x0.9999 --rotate right
