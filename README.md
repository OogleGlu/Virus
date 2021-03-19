# Virus
A virus based on `malloc()` [overcommit](https://www.etalabs.net/overcommit.html). It writes itself 
to the shell `rc` files so that every time you log in, your 
system freezes.

### Targets
- Any Unix shell

### Symptomps
- System freezes
- Programs crash
- CPU overheats

### Treatment
- Check `.profile` and your shell `rc` file (`.bashrc`, `.zshrc` or `.fishrc`).
- Comment out any suspicious looking code from any of these files.

### What it does?
- First run: it writes itself to the `rc` files.
- Next login: a payload is executed.
- Payload uses `malloc()` to blindly reserve 8GB of RAM.
- A loop is used to fill up those 8GB with garbage in background.
- Meanwhile, 2 more instances of the payload are opened.
