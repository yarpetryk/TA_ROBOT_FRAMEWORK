## Setup (Python 3.7)


```
1. Configure a virtual environment for PyCharm: File>Settings>Project Interpreter>Settings icon> Add Local 
2. Execute in terminal: pip install -r requirements.txt
3. Instal plugins IntelliBot and Robot Framework Support: File>Settings>Plugins
4. Download webdrivers and add paths in Environment variables
```

### Run all tests

```
robot -d Report *.robot
```

### Parallel Test Execution with Pabot

```
pabot -d Report *.robot
```

### Run specific tests with tags

```
robot --include tag_name --exclude tag_name .
```

### Set path to the output directory

```
robot --outputdir ./Tests/Report
```

### Run arguments tests with tags

```
robot -A create_user_negative_arguments -d Report *.robot
```