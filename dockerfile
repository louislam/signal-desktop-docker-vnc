FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Add Signal repo
RUN wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg && \
	cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null && \
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

RUN sudo apt update && sudo apt install signal-desktop=5.17.2

COPY /signal-desktop-with-dev-tools.desktop /root/Desktop/signal-desktop-with-dev-tools.desktop