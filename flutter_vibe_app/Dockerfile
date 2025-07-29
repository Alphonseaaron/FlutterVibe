FROM ubuntu:20.04

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
  git curl unzip xz-utils zip libglu1-mesa openjdk-17-jdk \
  clang cmake ninja-build pkg-config libgtk-3-dev \
  libimobiledevice6 libplist3 usbmuxd libusbmuxd6 \
  firebase-tools python3 python3-pip \
  && rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /opt/flutter
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:$PATH"

# Pre-cache
RUN flutter doctor -v && flutter precache --web --android --ios

WORKDIR /app
COPY . .

CMD ["bash", "-c", "flutter pub get && flutter build web --release && flutter build apk --release && flutter build ios --release --no-codesign"]
