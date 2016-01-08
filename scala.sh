version=2.11.7
scala_name=scala-${version}
scala_tar=${scala_name}.tgz
dir=~/local
scala_tar_path=${dir}/${scala_tar}

sudo apt-get -y install openjdk-8-jdk
curl http://downloads.typesafe.com/scala/${version}/${scala_tar} > ${scala_tar_path}
tar -xvf $scala_tar_path -C $dir
mv ${dir}/${scala_name} ${dir}/scala
