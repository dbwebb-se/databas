Setup a local development environment with eslint
========================

The idea is to use eslint (eslint --fix) as a development tool to work with the code style and linting of your JavaScript code.



Base dir `me/` with `package.json`
------------------------

The base dir is `me/` and you install the tools there and you can access them in any sub folder.

Start by creating a `package.json`.

```
cd me
npm init -y
```



Install eslint
------------------------

Now we install the linter [eslint](https://eslint.org/) and save it as a dev tool.

```
npm install eslint --save-dev
```



Configure eslint
------------------------

You can use the same configuration as `dbwebb validate` does by copying that config file.

```
# Stay in the me directory
cp ../example/dev-environment/.eslintrc.json .
```

The configuration file decides what type of code standard you are to follow in this project.



Run eslint
------------------------

Add the following scripts to the script-section of your `package.json`.

```
  "scripts": {
    "eslint":     "npx eslint . --ext js,mjs --no-eslintrc -c .eslintrc.json",
    "eslint:fix": "npx eslint . --ext js,mjs --no-eslintrc -c .eslintrc.json --fix"
  },
```

You can now see that the scripts are added by running this command.

```
npm run
```

You can now run the linter and the fixer like this.

```
npm run eslint
npm run eslint:fix
```



Install more
------------------------

You can now use the package.json at the me directory as you base for all your projects. Do not forget to add `--save` when you install the additional npm packages.
