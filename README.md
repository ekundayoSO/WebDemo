# Web testing with Robot Framework and SeleniumLibrary

```bash
pip install -r requirements.txt
```

## Starting demo application

Running tests requires the [demo application](demoapp) located under the `demoapp`
directory to be running.

```bash
python demoapp/server.py
python3 demoapp/server.py
```

After the demo application is started, it will be available at the URL
http://localhost:7272. You can test it manually; valid credentials are
`demo/mode`, and it needs to be running while executing the automated
tests.

Shutdown the server: `Ctrl-C`.

## Running tests

The [test cases](login_tests) are located in the `login_tests` directory. They can be
executed using the `robot` command:

```bash
robot login_tests
```

You can also run an individual test case file and use various command line
options supported by Robot Framework:

```bash
robot login_tests/valid_login.robot
robot --test InvalidUserName --loglevel DEBUG login_tests
```

## Using different browsers

The browser that is used is controlled by the `${BROWSER}` variable defined in
the `resource.robot` resource file. The Firefox browser is used by default, but that
can be easily overridden from the command line:

```bash
robot --variable BROWSER:Chrome login_tests
robot --variable BROWSER:IE login_tests
```

