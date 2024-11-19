# make-cpp

## Overview

`make-cpp` is a project management tool designed to simplify the process of compiling, cleaning, and managing C++ projects on Windows machines. It leverages Makefiles to automate these tasks, making it easier for developers to focus on writing code rather than managing build processes. This tool was initially created for use in CSCI-200 but can be adapted for any C++ project.

## Features

- **Compile Project**: Automatically compiles all `.cpp` files in the current directory.
- **Clean Project**: Removes all generated object files, dependency files, and executables.
- **Create New Makefile**: Generates a new Makefile based on a template.
- **Initialize New C++ Project**: Sets up a new C++ project with a basic `main.cpp` file and Makefile.
- **Zip Project**: Compiles the project, cleans it, and then zips the project directory for easy distribution.

## Installation

1. Clone the repository to your local machine.
2. Copy the `make-cpp.bat`, `MakefileTemplate.txt`, and `SFMLMakefileTemplate.txt` files to the `C:\Windows\System32` directory.

## Usage

Run the `make-cpp.bat` script to open the Project Manager Menu. From there, you can choose from the following options:

1. **Compile Project**: Compiles the project using the Makefile.
2. **Clean Project**: Cleans up all generated files.
3. **Create New Makefile**: Creates a new Makefile from the template.
4. **Initialize New C++ Project**: Initializes a new C++ project with a basic `main.cpp` file.
5. **Zip Project**: Compiles, cleans, and zips the project directory.
6. **Exit**: Exits the Project Manager Menu.

## Makefile Templates

### MakefileTemplate.txt

This template is used for standard C++ projects. It includes rules for compiling `.cpp` files, generating object files, and cleaning up generated files.

### SFMLMakefileTemplate.txt

This template is used for projects that utilize the SFML library. It includes additional configurations specific to SFML.

## Contributing

This project is still in development, and contributions are welcome. If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
