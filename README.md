# hacklab-mac-kali

Runs a kali linux virtual machine in a docker container on MacOS, with GUI applications supported.

## Installation

1. Install Rosetta by running the command `softwareupdate --install-rosetta`. This allows you to run apps built for Intel on the M1 mac.
1. Install Docker: https://docs.docker.com/docker-for-mac/install/
2. Install XQuartz in order to run GUI applications: https://www.xquartz.org
3. Once XQuartz is installed, visit XQuartz -> Preferences -> Security and check "Allow connections from network clients".
4. Log out and log back in to allow XQuartz to properly configure
5. Clone this repository: `git clone https://github.com/cablej/hacklab-mac-kali` (you may need to first [install git](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git#Installing-on-Mac))
6. Enter the directory: `cd hacklab-mac-kali`
7. Ensure that Docker is running
8. Run `./kali.sh run` in order to set up the machine and open a shell

### Details

`./kali.sh run` will be your go-to command, and automatically installs/starts the machine if needed. You can run `./kali.sh run` in multiple terminal windows/tabs in order to open multiple shells.

The machine comes with all of the tools you should need. For instance, to run Firefox and Burpsuite, run open two shells using `./kali.sh run` in two different windows. Run `firefox` in one window and `burpsuite` in the other, and both will open their GUI applications.

### Full usage

```
./kali.sh run     - opens a shell in the vm and initializes if needed
./kali.sh stop    - stops the vm
./kali.sh start   - starts the vm (run will do this automatically)
./kali.sh init    - initializes the vm (run will do this automatically)
./kali.sh status  - status of the vm
./kali.sh restart - restarts the vm container
 ```
