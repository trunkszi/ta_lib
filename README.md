#### Documentation reference [TA-Lib](https://www.ta-lib.org/)
+ This is the TA-Lib library, just switch the build system to xmake

#### Build system
+ xmake installation reference [xmake](https://xmake.io/#/getting_started)

```shell
# configuration mode
xmake f -m debug -a x64 -k static
# or
xmake f -m debug -a x64 -k shared
# or
xmake f -m release -a x64 -k static
# or
xmake f -m release -a x64 -k shared

# Generate CMakeLists.txt
xmake project -k cmake -y

# Generate visual studio vcxproj
xmake project -k vs2022 -y
# or
xmake project -k vs2019 -y

# build 
xmake -rv
```