Local development environment
========================

This local development environemnt is installed using the following commands.

```
npm install mysql promise-mysql --save
npm install eslint --save-dev
```

These are the scripts added to the `package.json`.

```
"test": "npm run eslint",
"clean": "rm -rf node_modules package-lock.json",
"eslint": "npx eslint *.js src --no-eslintrc -c .eslintrc.json",
"eslint:fix": "npx eslint *.js src --no-eslintrc -c .eslintrc.json --fix"
```



Run eslint
------------------------

There is a config file for eslint in `.eslintrc.json`.

Run the eslint validator like this.

```
# To validate things
npm run eslint

# To fix things
npm run eslint:fix
```



Enable dev environment in me/
------------------------

Copy the following files to enable the same setup in your `me/` directory.

Before you start you might want to look if you already have a `me/package.json` and check what it contains. The procedure below might overwrite your existing file.

```
# Go to the root of the repo
cp -i example/package.json me
cp -i example/.eslintrc.json me
```

Now you should be able to run eslint and its fixer in the me directory also.
