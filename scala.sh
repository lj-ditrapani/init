version=2.11.8
scala_name=scala-${version}
scala_tar=${scala_name}.tgz
dir=~/local
scala_tar_path=${dir}/${scala_tar}

curl http://downloads.lightbend.com/scala/${version}/${scala_tar} > ${scala_tar_path}
tar -xvf $scala_tar_path -C $dir
mv ${dir}/${scala_name} ${dir}/scala

# Conscript
curl https://raw.githubusercontent.com/foundweekends/conscript/master/setup.sh | sh

# giter8
cs foundweekends/giter8
g8
