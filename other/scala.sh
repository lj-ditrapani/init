version=2.12.6
scala_name=scala-${version}
scala_tar=${scala_name}.tgz
dir=~/local
scala_tar_path=${dir}/${scala_tar}

curl http://downloads.lightbend.com/scala/${version}/${scala_tar} > ${scala_tar_path}
tar -xvf $scala_tar_path -C $dir
mv ${dir}/${scala_name} ${dir}/scala

cd ~
curl -L -o coursier https://git.io/vgvpD && chmod +x coursier
sudo ./coursier bootstrap com.geirsson:scalafmt-cli_2.12:1.5.1 \
  -r bintray:scalameta/maven \
  -o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli
