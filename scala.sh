version=2.11.7
scala_name=scala-${version}
scala_tar=${scala_name}.tgz
dir=~/local
scala_tar_path=${dir}/${scala_tar}

sudo apt-get -y install openjdk-8-jdk
curl http://downloads.typesafe.com/scala/${version}/${scala_tar} > ${scala_tar_path}
tar -xvf $scala_tar_path -C $dir
mv ${dir}/${scala_name} ${dir}/scala

# Conscript
curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh

# giter8
cs n8han/giter8

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt
