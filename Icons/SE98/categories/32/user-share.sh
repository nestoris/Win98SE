for destination in applications-graphics.png applications-multimedia.png applications-office.png gnome-applications.png gnome-graphics.png gnome-multimedia.png gnome-other.png multimedia_section.png package_graphics.png package_multimedia.png package_office.png package_system.png plugins-general.png redhat-graphics.png redhat-office.png redhat-sound_video.png redhat-system_tools.png xfce-graphics.png xfce-internet.png xfce-multimedia.png xfce-office.png; do
    ln -sfr ./applications-other.png "$destination"
done
