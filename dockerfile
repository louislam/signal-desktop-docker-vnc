FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Add Signal repo
RUN wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg && \
	cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null && \
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list && \
	apt update && apt install signal-desktop=5.17.2

RUN sed -i "s#^command=/usr/bin/openbox\$#& --startup /etc/xdg/openbox/autostart#" /etc/supervisor/conf.d/supervisord.conf

COPY /signal-desktop-with-dev-tools.desktop /root/Desktop/signal-desktop-with-dev-tools.desktop
COPY autostart /tmp/autostart
RUN cat /tmp/autostart >> /etc/xdg/openbox/autostart

