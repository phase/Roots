rm -rf minecraft/bin/
rm -rf minecraft/src/
mkdir -p minecraft/bin/
mkdir -p minecraft/src/
java -XX:+UseG1GC -jar lib/SpecialSource.jar map -i "a1.2.6.jar" -m "client.srg" -o "minecraft/a1.2.6-mapped.jar"

echo "Decompiling Minecraft classes"
java -XX:+UseG1GC -jar lib/fernflower.jar "-dgs=1" "-hdc=0" "-asc=1" "-udv=0" "-din=1" "-rbr=0" "-rsy=1" "minecraft/a1.2.6-mapped.jar" "minecraft/src/" | awk '$4 ~ "minecraft" {printf "Decompiling %s\r", $4}'

printf "\nExtracting sources\n"
rm -rf src
mkdir -p src
cd src
jar xf ../minecraft/src/a1.2.6-mapped.jar