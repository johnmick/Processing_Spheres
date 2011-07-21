SRC_DIR = src
BUILD_DIR = .

BASE_FILES = ${SRC_DIR}/core.pde\
	${SRC_DIR}/sphere.pde\
	${SRC_DIR}/menu.pde\

spheres.pde : ${BASE_FILES}
	@@echo -n "Building "
	@@cat ${BASE_FILES} > ${BUILD_DIR}/spheres.pde
	@@echo " [Done]"

clean :
	@@echo -n "Removing Directory Contents " 
	@@rm -rf ${BUILD_DIR}/spheres.pde
	@@echo " [Done]"
