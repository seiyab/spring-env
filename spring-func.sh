JDK_IMAGE=java

maven-package() {
    docker run --rm -a stdout -a stderr -t -v $(pwd)/$1:/project -w /project --entrypoint /project/mvnw $JDK_IMAGE clean package
}

exec-jar() {
    docker run --rm --expose $2 -p $2:$2 -v $(pwd)/$(dirname $1):/target --entrypoint java $JDK_IMAGE -jar /target/$(basename $1) --server.port=$2
}
