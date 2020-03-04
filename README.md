
## Git hooks
Easy to use example of how to create pre-commit / pre-push hooks to automatically run tests.

In this project we are using the golint check on pre-commit and go test on pre-push but you can easily change it to your own need

## How to use
- Clone the project wherever you like `git clone https://github.com/apssouza22/githooks`
- Go into your git repository and run the `PATH/TO/THIS/REPO/install-hooks.sh`
- Now change something, and try to commit
``` bash
git commit -am "test change"
>> Running pre-commit hook
>> Running Golint
>> ............................
```
- The same for push 
```
git push
>> Running pre-push hook
>> Running Go test
>> ............................
```

### Skipping hook flag:

``` bash
git commit --no-verify -am "test"
git push --no-verify
```
