# Add the signing key for the Materialize apt repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 79DEC5E1B7AE7694

# Add and update the repository
sudo sh -c 'echo "deb http://apt.materialize.com/ generic main" > /etc/apt/sources.list.d/materialize.list'
sudo apt update

# Install materialized
sudo apt install materialized