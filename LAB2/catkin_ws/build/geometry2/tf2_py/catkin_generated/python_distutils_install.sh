#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/src/geometry2/tf2_py"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/install/lib/python3/dist-packages:/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/build" \
    "/usr/bin/python3" \
    "/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/src/geometry2/tf2_py/setup.py" \
    build --build-base "/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/build/geometry2/tf2_py" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/install" --install-scripts="/home/andac/Workspace/eece5554_roboticssensing/LAB2/catkin_ws/install/bin"
