# Usage 

1. Create a file "course.data" and enter your course id.

For example:

course.data
```text
1234
```

2. Get a Canvas token from https://bth.instructure.com/profile/settings.

Add the token to the environment variable CANVAS_TOKEN.

<!-- 2. Create a file "teachers.data" and add all teachers. One per row.

For example:

teachers.data
```text
John Doe
Jane Doe
Doe Jane
Doe John
``` -->

3. Run `$ bash grader.bash fetch` # get new data
4. Run `$ bash grader.bash print` # print the data

-----------------------------------------------------------
```
Commands:
'init' (Use new coursecode)
'fetch' (Fetches new data from Canvas)
'save' (Saves the current result)
'print' (Prints current result)
```