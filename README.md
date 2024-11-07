# ZombieBuild

## Setting up Docker on Windows
- Install Docker Desktop https://www.docker.com/get-started/ 

- Install "git" https://git-scm.com/download/win

- Update WSL if required https://medium.com/@dilsharahasanka/solved-docker-desktop-requires-a-newer-wsl-kernel-version-on-windows-b093b1684c0b

## Setting up Docker on Linux/Unix/MacOSX

- Install Docker Desktop https://www.docker.com/get-started/ 

- If not already installed, install git with the package manager of your distribution.

## Download ZombieBuild

You can either clone the ZombieBuild repository via git (recommended) or download the .zip archive.
First you nagivate in the command window to the desired location where you want to store ZombieBuild and then execute the following command.
Git will create a ``zombiebuild-master`` subdirectory.
```
git clone https://github.com/crasbe/ZombieBuild.git
```

Otherwise you can download the repository as a .zip archive and unpack it manually. You can navigate to the green "Code" button above the file list or use this link: https://github.com/crasbe/ZombieBuild/archive/refs/heads/main.zip

## Setting up the Container
The "setupContainer" script initiates the setup process and creates a Docker image, from which the Docker container is built.

For Windows, the "setupContainer.bat" batch file should be used while for Linux/Unix/MacOSX the "setupContainer.sh" file should be used.

## Running the Container

The "setupContainer" script already starts the container, however after rebooting your host, the container has to be restarted. This can be done in the Docker Desktop Application or with the "startContainer.bat" batch script in Windows or "startContainer.sh" for Linux/Unix/MacOSX.

## Compiling the ZombieVerter/BMS Code
The setup script initially pulls the GitHub repositories of the ZombieVerter and Tesla Model 3 BMS projects. The code is located in the "code" subfolder, which is bind mounted to the "/app" folder in the Docker container.

For compiling on a Windows host, the "compileZombie-VCU.bat" and "compileZombie-M3BMS.bat" files can be used for the ZombieVerter and M3BMS project. For Linux/Unix/MacOSX, the "compileZombie-VCU.sh" and "compileZombie-M3BMS.bat" files should be used.

The source code itself can be editied with your favourite IDE or editor. The source control is done with git inside of the respective directories in the "code" subfolder.

## See also

ZombieVerter Project: https://github.com/damienmaguire/Stm32-vcu

Tesla Model 3 BMS Project: https://github.com/damienmaguire/tesla-Model-3-Battery-BMS
