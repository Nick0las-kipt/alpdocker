1. Remove previous alpbuilder immmmage and containers
2. put toolchain.tar to images/builder16/1.1
3. Run "tools/alpbuilder" it will build the image and bring up container. You will see the following:
	Successfully tagged alpental/builder16:1.1
	make: Leaving directory '/home/nick/projects/alpdocker/images/builder16/1.1'
	Docker shell started. You are in docker environment now.
	user@debian10:~/projects/alpdocker$ 
4. To force rebuild image use "tools/alpbuilder -f"
5. to build android use android_build.sh. for help use android_build.sh -h.
