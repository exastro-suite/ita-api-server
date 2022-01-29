FROM almalinux:8.5

# Update root CA
RUN --mount=type=secret,id=extra-root-ca \
if [ -f /run/secrets/extra-root-ca ]; then \
    cp /run/secrets/extra-root-ca /usr/share/pki/ca-trust-source/anchors/extra-root-ca.crt; \
    update-ca-trust; \
fi

# Copy resources
COPY docker-entrypoint.sh requirements.txt /
COPY exastro/ /exastro-packages/exastro/

# Install Python
RUN dnf install -y python3; pip3 install -r requirements.txt

# Working directory
WORKDIR /exastro-packages

# Entrypoint and command
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/python3", "-m", "exastro.ita.apiserver"]
