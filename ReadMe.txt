1. Remove previous alpbuilder immmmage and containers
2. Run "tools/alpbuilder" it will build the image and bring up container. You will see the following:
	Successfully tagged alpental/builder16:1.1
	make: Leaving directory '/home/nick/projects/alpdocker/images/builder16/1.1'
	Docker shell started. You are in docker environment now.
	user@debian10:~/projects/alpdocker$ 
3. To force rebuild image use "tools/alpbuilder -f"
4. to build android use android_build.sh. for help use android_build.sh -h.
