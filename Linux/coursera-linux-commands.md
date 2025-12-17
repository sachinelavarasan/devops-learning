# Linux Quick Reference Cheat Sheet

## 1. File System Navigation

### `pwd` - Print the current working directory

**Examples:**

```bash
# Example 1: Basic usage
$ pwd
/home/user/documents

# Example 2: In root directory
$ pwd
/

# Example 3: In a nested directory
$ pwd
/var/log/apache2

# Example 4: After changing directories
$ cd /etc
$ pwd
/etc

# Example 5: Using pwd in scripts
$ echo "Current location: $(pwd)"
Current location: /home/user/projects
```

---

### `ls` - List files and directories

**Examples:**

```bash
# Example 1: Basic listing
$ ls
Desktop  Documents  Downloads  Music  Pictures  Videos

# Example 2: List with details (-l)
$ ls -l
total 24
drwxr-xr-x 2 user user 4096 Dec 17 07:00 Desktop
drwxr-xr-x 5 user user 4096 Dec 17 06:30 Documents
drwxr-xr-x 3 user user 4096 Dec 16 15:20 Downloads

# Example 3: List including hidden files (-a)
$ ls -a
.  ..  .bashrc  .profile  Desktop  Documents  Downloads

# Example 4: List with human-readable sizes (-lh)
$ ls -lh
total 24K
drwxr-xr-x 2 user user 4.0K Dec 17 07:00 Desktop
drwxr-xr-x 5 user user 4.0K Dec 17 06:30 Documents

# Example 5: List sorted by modification time (-lt)
$ ls -lt
drwxr-xr-x 2 user user 4096 Dec 17 07:00 Desktop
drwxr-xr-x 5 user user 4096 Dec 17 06:30 Documents
drwxr-xr-x 3 user user 4096 Dec 16 15:20 Downloads
```

---

### `cd` - Change directory

**Examples:**

```bash
# Example 1: Change to specific directory
$ cd /var/log
$ pwd
/var/log

# Example 2: Go up one level (..)
$ pwd
/home/user/documents/projects
$ cd ..
$ pwd
/home/user/documents

# Example 3: Go to home directory (~)
$ cd ~
$ pwd
/home/user

# Example 4: Go to previous directory (-)
$ cd /etc
$ cd -
/home/user
$ pwd
/home/user

# Example 5: Change to relative path
$ pwd
/home/user
$ cd documents/work
$ pwd
/home/user/documents/work
```

---

### `mkdir` - Create a new directory

**Examples:**

```bash
# Example 1: Create single directory
$ mkdir projects
$ ls
Desktop  Documents  projects

# Example 2: Create multiple directories
$ mkdir dir1 dir2 dir3
$ ls
dir1  dir2  dir3

# Example 3: Create nested directories (-p)
$ mkdir -p parent/child/grandchild
$ ls -R parent
parent:
child

parent/child:
grandchild

# Example 4: Create with specific permissions (-m)

# Combinations of permissions result in the following single-digit numbers:
0 (---): No permissions
1 (--x): Execute only
2 (-w-): Write only
3 (-wx): Write and execute
4 (r--): Read only
5 (r-x): Read and execute
6 (rw-): Read and write
7 (rwx): Read, write, and execute 

$ mkdir -m 755 public_folder
$ ls -ld public_folder
drwxr-xr-x 2 user user 4096 Dec 17 07:00 public_folder


# Example 5: Create directory with verbose output (-v)
$ mkdir -v new_project
mkdir: created directory 'new_project'
```

---

### `rm` - Remove files and directories

**Examples:**

```bash
# Example 1: Remove a single file
$ rm test.txt
$ ls
file1.txt  file2.txt

# Example 2: Remove multiple files
$ rm file1.txt file2.txt file3.txt
$ ls
(empty)

# Example 3: Remove directory recursively (-r)
$ rm -r old_project
$ ls
current_project

# Example 4: Remove with confirmation (-i)
$ rm -i important.txt
rm: remove regular file 'important.txt'? y

# Example 5: Force remove without prompts (-rf)
$ rm -rf temp_folder
$ ls
(temp_folder removed)
```

---

### `cp` - Copy files and directories

**Examples:**

```bash
# Example 1: Copy a file
$ cp source.txt backup.txt
$ ls
source.txt  backup.txt

# Example 2: Copy to different directory
$ cp file.txt /home/user/backup/
$ ls /home/user/backup/
file.txt

# Example 3: Copy directory recursively (-r)
$ cp -r project_folder project_backup
$ ls
project_folder  project_backup

# Example 4: Copy with verbose output (-v)
$ cp -v data.txt data_copy.txt
'data.txt' -> 'data_copy.txt'

# Example 5: Copy preserving attributes (-p)
$ cp -p original.txt copy.txt
$ ls -l
-rw-r--r-- 1 user user 1234 Dec 17 06:00 original.txt
-rw-r--r-- 1 user user 1234 Dec 17 06:00 copy.txt
```

---

### `mv` - Move or rename files and directories

**Examples:**

```bash
# Example 1: Rename a file
$ mv oldname.txt newname.txt
$ ls
newname.txt

# Example 2: Move file to different directory
$ mv file.txt /home/user/documents/
$ ls /home/user/documents/
file.txt

# Example 3: Move multiple files
$ mv file1.txt file2.txt file3.txt /backup/
$ ls /backup/
file1.txt  file2.txt  file3.txt

# Example 4: Move with verbose output (-v)
$ mv -v report.pdf reports/
'report.pdf' -> 'reports/report.pdf'

# Example 5: Move and rename simultaneously
$ mv /tmp/data.txt /home/user/important_data.txt
$ ls /home/user/
important_data.txt
```

## 2. File Manipulation

### `cat` - Display the contents of a file

**Examples:**

```bash
# Example 1: Display file contents
$ cat hello.txt
Hello World!
This is a test file.

# Example 2: Display multiple files
$ cat file1.txt file2.txt
Contents of file1
Contents of file2

# Example 3: Number all lines (-n)
$ cat -n script.sh
     1  #!/bin/bash
     2  echo "Hello"
     3  exit 0

# Example 4: Concatenate files into new file
$ cat header.txt body.txt > complete.txt
$ cat complete.txt
Header content
Body content

# Example 5: Display with line endings visible (-E)
$ cat -E data.txt
Line 1$
Line 2$
Line 3$
```

---

### `less` - View file contents with pagination

**Examples:**

```bash
# Example 1: View large file
$ less /var/log/syslog
(opens paginated view, press 'q' to quit)

# Example 2: View with line numbers (-N)
$ less -N config.txt
      1 # Configuration File
      2 setting1=value1
      3 setting2=value2

# Example 3: Search within less (type /pattern)
$ less largefile.txt
/error
(highlights all instances of 'error')

# Example 4: View from specific line (+line_number)
$ less +50 document.txt
(starts viewing from line 50)

# Example 5: View multiple files
$ less file1.txt file2.txt
(use :n for next file, :p for previous)
```

---

### `head` - Display first few lines of a file

**Examples:**

```bash
# Example 1: Show first 10 lines (default)
$ head access.log
192.168.1.1 - - [17/Dec/2025:07:00:01]
192.168.1.2 - - [17/Dec/2025:07:00:02]
192.168.1.3 - - [17/Dec/2025:07:00:03]
...

# Example 2: Show first 5 lines (-n)
$ head -n 5 users.txt
alice
bob
charlie
david
eve

# Example 3: Show first 20 bytes (-c)
$ head -c 20 data.txt
First 20 character

# Example 4: Show first lines of multiple files
$ head -n 3 file1.txt file2.txt
==> file1.txt <==
Line 1
Line 2
Line 3

==> file2.txt <==
Data 1
Data 2
Data 3

# Example 5: Exclude last N lines (--lines=-N)
$ head --lines=-5 numbers.txt
1
2
3
(shows all except last 5 lines)
```

---

### `tail` - Display last few lines of a file

**Examples:**

```bash
# Example 1: Show last 10 lines (default)
$ tail error.log
[ERROR] Connection timeout
[ERROR] Database unreachable
[ERROR] Service stopped
...

# Example 2: Show last 5 lines (-n)
$ tail -n 5 messages.txt
Message 96
Message 97
Message 98
Message 99
Message 100

# Example 3: Follow file updates in real-time (-f)
$ tail -f /var/log/apache2/access.log
192.168.1.10 - - [17/Dec/2025:07:35:01]
(continues showing new lines as they're added)

# Example 4: Show last 50 bytes (-c)
$ tail -c 50 file.txt
last fifty characters of the file content

# Example 5: Follow with retry (--retry)
$ tail -f --retry app.log
(keeps trying if file doesn't exist yet)
```

---

### `grep` - Search for patterns in files

**Examples:**

```bash
# Example 1: Basic pattern search
$ grep "error" application.log
2025-12-17 07:00:01 ERROR: Connection failed
2025-12-17 07:15:23 ERROR: Timeout occurred

# Example 2: Case-insensitive search (-i)
$ grep -i "warning" system.log
WARNING: Low disk space
Warning: Service degraded
warning: Check configuration

# Example 3: Show line numbers (-n)
$ grep -n "TODO" code.py
15:# TODO: Implement error handling
42:# TODO: Add validation
78:# TODO: Optimize performance

# Example 4: Recursive search in directory (-r)
$ grep -r "function" src/
src/main.js:function init() {
src/utils.js:function helper() {
src/app.js:function start() {

# Example 5: Count matching lines (-c)
$ grep -c "success" results.txt
47
```

---

## 3. File Permissions

### `chmod` - Change file permissions

**Examples:**

```bash
# Example 1: Add execute permission
$ chmod +x script.sh
$ ls -l script.sh
-rwxr-xr-x 1 user user 256 Dec 17 07:00 script.sh

# Example 2: Set specific permissions (numeric)
$ chmod 755 program.sh
$ ls -l program.sh
-rwxr-xr-x 1 user user 512 Dec 17 07:00 program.sh

# Example 3: Remove write permission
$ chmod -w file.txt
$ ls -l file.txt
-r--r--r-- 1 user user 1024 Dec 17 07:00 file.txt

# Example 4: Recursive permission change (-R)
$ chmod -R 644 documents/
$ ls -l documents/
-rw-r--r-- 1 user user 2048 Dec 17 07:00 doc1.txt
-rw-r--r-- 1 user user 3072 Dec 17 07:00 doc2.txt

# Example 5: Set permissions for user, group, others
$ chmod u=rwx,g=rx,o=r myfile
$ ls -l myfile
-rwxr-xr-- 1 user user 4096 Dec 17 07:00 myfile
```

---

### `chown` - Change file owner and group

**Examples:**

```bash
# Example 1: Change owner
$ sudo chown alice file.txt
$ ls -l file.txt
-rw-r--r-- 1 alice user 1024 Dec 17 07:00 file.txt

# Example 2: Change owner and group
$ sudo chown alice:developers project.txt
$ ls -l project.txt
-rw-r--r-- 1 alice developers 2048 Dec 17 07:00 project.txt

# Example 3: Recursive ownership change (-R)
$ sudo chown -R bob:staff /home/bob/files/
$ ls -l /home/bob/files/
-rw-r--r-- 1 bob staff 512 Dec 17 07:00 data.txt

# Example 4: Change only group (:group)
$ sudo chown :admin config.conf
$ ls -l config.conf
-rw-r--r-- 1 user admin 256 Dec 17 07:00 config.conf

# Example 5: Preserve root directory (--preserve-root)
$ sudo chown --preserve-root -R user:user /
chown: it is dangerous to operate recursively on '/'
```

---

### `chgrp` - Change group ownership

**Examples:**

```bash
# Example 1: Change group
$ chgrp developers app.py
$ ls -l app.py
-rw-r--r-- 1 user developers 1536 Dec 17 07:00 app.py

# Example 2: Recursive group change (-R)
$ chgrp -R staff project/
$ ls -l project/
drwxr-xr-x 2 user staff 4096 Dec 17 07:00 src

# Example 3: Verbose output (-v)
$ chgrp -v admin settings.conf
changed group of 'settings.conf' from user to admin

# Example 4: Change using reference file (--reference)
$ chgrp --reference=template.txt newfile.txt
$ ls -l newfile.txt
-rw-r--r-- 1 user developers 512 Dec 17 07:00 newfile.txt

# Example 5: Only change if current group matches (--from)
$ chgrp --from=oldgroup newgroup file.dat
$ ls -l file.dat
-rw-r--r-- 1 user newgroup 2048 Dec 17 07:00 file.dat
```

## 4. Process Management

### `ps` - Display information about active processes

**Examples:**

```bash
# Example 1: Show current user processes
$ ps
  PID TTY          TIME CMD
 1234 pts/0    00:00:00 bash
 5678 pts/0    00:00:00 ps

# Example 2: Show all processes (-ef)
$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 06:00 ?        00:00:01 /sbin/init
user      1234     1  0 07:00 pts/0    00:00:00 bash
user      5678  1234  0 07:35 pts/0    00:00:00 ps -ef

# Example 3: Show processes in tree format (--forest)
$ ps -ef --forest
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 06:00 ?        00:00:01 /sbin/init
root       123     1  0 06:00 ?        00:00:00  \_ /usr/sbin/sshd
user      1234   123  0 07:00 pts/0    00:00:00      \_ bash

# Example 4: Show processes for specific user (-u)
$ ps -u alice
  PID TTY          TIME CMD
 2345 ?        00:00:05 nginx
 2346 ?        00:00:02 node

# Example 5: Custom format output (-o)
$ ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
  PID  PPID CMD                         %MEM %CPU
 1234     1 /usr/bin/chrome             15.2  5.3
 5678     1 /usr/bin/mysql              12.1  8.7
```

---

### `kill` - Terminate a process

**Examples:**

```bash
# Example 1: Kill process by PID (SIGTERM)
$ kill 1234
$ ps -p 1234
(process terminated)

# Example 2: Force kill (SIGKILL)
$ kill -9 5678
$ ps -p 5678
(process forcefully terminated)

# Example 3: Send specific signal (-s)
$ kill -s SIGHUP 2345
(process receives hangup signal)

# Example 4: List all available signals (-l)
$ kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL
 5) SIGTRAP      6) SIGABRT      7) SIGBUS       8) SIGFPE
 9) SIGKILL     10) SIGUSR1     11) SIGSEGV     12) SIGUSR2

# Example 5: Kill multiple processes
$ kill 1111 2222 3333
(terminates all three processes)
```

---

### `killall` - Terminate processes by name

**Examples:**

```bash
# Example 1: Kill all processes by name
$ killall firefox
(all firefox processes terminated)

# Example 2: Interactive mode (-i)
$ killall -i chrome
Kill chrome(1234) ? (y/N) y
Kill chrome(5678) ? (y/N) n

# Example 3: Kill with specific signal
$ killall -9 nginx
(forcefully kills all nginx processes)

# Example 4: Verbose output (-v)
$ killall -v apache2
Killed apache2(1234) with signal 15
Killed apache2(5678) with signal 15

# Example 5: Wait for processes to die (-w)
$ killall -w python
(waits until all python processes terminate)
```

---

### `top` - Display real-time system processes

**Examples:**

```bash
# Example 1: Basic usage
$ top
top - 07:35:42 up 1:35,  2 users,  load average: 0.52, 0.58, 0.59
Tasks: 245 total,   1 running, 244 sleeping,   0 stopped,   0 zombie
%Cpu(s):  5.2 us,  2.1 sy,  0.0 ni, 92.3 id,  0.4 wa,  0.0 hi,  0.0 si
MiB Mem :  15842.5 total,   8234.2 free,   4521.3 used,   3087.0 buff/cache

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 1234 user      20   0 2456788 345612  89432 S   8.3   2.1   0:45.23 chrome
 5678 user      20   0 1234567 123456  45678 S   3.2   0.8   0:12.34 node

# Example 2: Sort by memory usage (press Shift+M)
$ top
(displays processes sorted by memory usage)

# Example 3: Show specific user (-u)
$ top -u alice
(shows only alice's processes)

# Example 4: Batch mode for logging (-b -n 1)
$ top -b -n 1 > top_snapshot.txt
$ cat top_snapshot.txt
(single snapshot of top output)

# Example 5: Update interval (-d)
$ top -d 5
(updates every 5 seconds instead of default 3)
```

---

### `bg` - Put process in background

**Examples:**

```bash
# Example 1: Resume stopped job in background
$ sleep 100
^Z
[1]+  Stopped                 sleep 100
$ bg
[1]+ sleep 100 &

# Example 2: Background specific job number
$ bg %1
[1]+ sleep 100 &

# Example 3: Check background jobs
$ jobs
[1]+  Running                 sleep 100 &

# Example 4: Start command directly in background
$ long_process &
[1] 1234

# Example 5: Multiple background jobs
$ sleep 50 &
[1] 1111
$ sleep 60 &
[2] 2222
$ jobs
[1]-  Running                 sleep 50 &
[2]+  Running                 sleep 60 &
```

---

### `fg` - Bring background process to foreground

**Examples:**

```bash
# Example 1: Bring most recent job to foreground
$ sleep 100 &
[1] 1234
$ fg
sleep 100

# Example 2: Bring specific job to foreground
$ jobs
[1]-  Running                 sleep 50 &
[2]+  Running                 sleep 60 &
$ fg %1
sleep 50

# Example 3: Resume stopped job in foreground
$ sleep 100
^Z
[1]+  Stopped                 sleep 100
$ fg
sleep 100

# Example 4: Foreground by job number
$ fg %2
sleep 60

# Example 5: Check job status after fg
$ jobs
[1]+  Running                 sleep 100 &
$ fg %1
sleep 100
(now running in foreground)
```

## 5. System Information

### `uname` - Print system information

**Examples:**

```bash
# Example 1: Basic usage (kernel name)
$ uname
Linux

# Example 2: All information (-a)
$ uname -a
Linux server 5.15.0-56-generic #62-Ubuntu SMP x86_64 GNU/Linux

# Example 3: Kernel release (-r)
$ uname -r
5.15.0-56-generic

# Example 4: Machine hardware name (-m)
$ uname -m
x86_64

# Example 5: Operating system (-o)
$ uname -o
GNU/Linux
```

---

### `whoami` - Display current user

**Examples:**

```bash
# Example 1: Show current username
$ whoami
user

# Example 2: Use in scripts
$ echo "Logged in as: $(whoami)"
Logged in as: user

# Example 3: Check after su
$ su - alice
$ whoami
alice

# Example 4: Combine with hostname
$ echo "$(whoami)@$(hostname)"
user@server

# Example 5: Verify sudo context
$ sudo whoami
root
```

---

### `df` - Show disk space usage

**Examples:**

```bash
# Example 1: Basic usage
$ df
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda1       51474912 8234567  40598765  17% /

# Example 2: Human-readable format (-h)
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G  7.9G   39G  17% /
/dev/sdb1       100G   45G   51G  47% /data

# Example 3: Show inode information (-i)
$ df -i
Filesystem      Inodes  IUsed   IFree IUse% Mounted on
/dev/sda1      3276800 234567 3042233    8% /

# Example 4: Show specific filesystem type (-t)
$ df -t ext4
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda1       51474912 8234567  40598765  17% /

# Example 5: Exclude filesystem type (-x)
$ df -h -x tmpfs
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G  7.9G   39G  17% /
```

---

### `free` - Display memory usage

**Examples:**

```bash
# Example 1: Basic usage
$ free
              total        used        free      shared  buff/cache   available
Mem:       16384000     4521300     8234200      123400     3628500    11234500
Swap:       2097152           0     2097152

# Example 2: Human-readable (-h)
$ free -h
              total        used        free      shared  buff/cache   available
Mem:           15Gi       4.3Gi       7.9Gi       120Mi       3.5Gi        10Gi
Swap:         2.0Gi          0B       2.0Gi

# Example 3: Show in megabytes (-m)
$ free -m
              total        used        free      shared  buff/cache   available
Mem:          15999        4415        8041         120        3543       10980
Swap:          2047           0        2047

# Example 4: Continuous monitoring (-s)
$ free -h -s 5
(updates every 5 seconds)

# Example 5: Show totals (-t)
$ free -h -t
              total        used        free      shared  buff/cache   available
Mem:           15Gi       4.3Gi       7.9Gi       120Mi       3.5Gi        10Gi
Swap:         2.0Gi          0B       2.0Gi
Total:         17Gi       4.3Gi       9.9Gi
```

---

### `uptime` - Show system uptime

**Examples:**

```bash
# Example 1: Basic usage
$ uptime
 07:35:42 up 1 day,  3:25,  2 users,  load average: 0.52, 0.58, 0.59

# Example 2: Pretty format (-p)
$ uptime -p
up 1 day, 3 hours, 25 minutes

# Example 3: Show since when (-s)
$ uptime -s
2025-12-16 04:10:42

# Example 4: Use in monitoring
$ echo "System $(uptime -p)"
System up 1 day, 3 hours, 25 minutes

# Example 5: Check load average
$ uptime | awk '{print $10,$11,$12}'
0.52, 0.58, 0.59
```

## 6. Text Editing

### `nano` - Text editor

**Examples:**

```bash
# Example 1: Open/create file
$ nano myfile.txt
(opens nano editor)

# Example 2: Open at specific line (+LINE)
$ nano +25 script.sh
(opens at line 25)

# Example 3: Open as read-only (-v)
$ nano -v config.conf
(view mode only)

# Example 4: Create backup on save (-B)
$ nano -B important.txt
(creates important.txt~ backup)

# Example 5: Show line numbers (-l)
$ nano -l code.py
(displays line numbers)
```

---

### `vi/vim` - Text editor

**Examples:**

```bash
# Example 1: Open file
$ vi document.txt
(opens vi editor, press 'i' for insert mode)

# Example 2: Open at specific line
$ vi +42 script.sh
(opens at line 42)

# Example 3: Open multiple files
$ vi file1.txt file2.txt
(use :n for next, :prev for previous)

# Example 4: Open in read-only mode
$ vi -R config.conf
(read-only mode)

# Example 5: Execute command on open
$ vi +/error logfile.txt
(opens and searches for 'error')
```

---

### `sed` - Stream editor

**Examples:**

```bash
# Example 1: Replace first occurrence
$ echo "hello world hello" | sed 's/hello/hi/'
hi world hello

# Example 2: Replace all occurrences (g flag)
$ echo "hello world hello" | sed 's/hello/hi/g'
hi world hi

# Example 3: Delete lines matching pattern
$ sed '/^#/d' config.txt
(removes comment lines)

# Example 4: In-place editing (-i)
$ sed -i 's/old/new/g' file.txt
(modifies file directly)

# Example 5: Print specific lines
$ sed -n '10,20p' largefile.txt
(prints lines 10-20)
```

## 7. Compression and Archiving

### `tar` - Archive files

**Examples:**

```bash
# Example 1: Create archive (-c)
$ tar -cf archive.tar file1.txt file2.txt
$ ls -lh archive.tar
-rw-r--r-- 1 user user 10K Dec 17 07:00 archive.tar

# Example 2: Create compressed archive (-czf)
$ tar -czf backup.tar.gz /home/user/documents/
$ ls -lh backup.tar.gz
-rw-r--r-- 1 user user 2.5M Dec 17 07:00 backup.tar.gz

# Example 3: Extract archive (-xf)
$ tar -xf archive.tar
$ ls
file1.txt  file2.txt  archive.tar

# Example 4: List archive contents (-tf)
$ tar -tf backup.tar.gz
home/user/documents/
home/user/documents/file1.txt
home/user/documents/file2.txt

# Example 5: Extract to specific directory (-C)
$ tar -xzf backup.tar.gz -C /tmp/restore/
$ ls /tmp/restore/
home
```

---

### `gzip` - Compress files

**Examples:**

```bash
# Example 1: Compress file
$ gzip largefile.txt
$ ls
largefile.txt.gz

# Example 2: Keep original file (-k)
$ gzip -k document.txt
$ ls
document.txt  document.txt.gz

# Example 3: Decompress (-d)
$ gzip -d file.txt.gz
$ ls
file.txt

# Example 4: Compress with best compression (-9)
$ gzip -9 bigfile.log
$ ls -lh bigfile.log.gz
-rw-r--r-- 1 user user 1.2M Dec 17 07:00 bigfile.log.gz

# Example 5: View compressed file (zcat)
$ zcat file.txt.gz
Contents of compressed file
(displays without decompressing)
```

## 8. Networking

### `ssh` - Secure shell connection

**Examples:**

```bash
# Example 1: Connect to remote server
$ ssh user@192.168.1.100
user@192.168.1.100's password:
Welcome to Ubuntu 22.04 LTS

# Example 2: Connect with specific port (-p)
$ ssh -p 2222 admin@server.com
admin@server.com's password:

# Example 3: Execute remote command
$ ssh user@server 'uptime'
 07:35:42 up 5 days,  3:25,  2 users,  load average: 0.52, 0.58, 0.59

# Example 4: Use SSH key (-i)
$ ssh -i ~/.ssh/mykey.pem ubuntu@ec2-instance.com
Welcome to Amazon Linux 2

# Example 5: Verbose output (-v)
$ ssh -v user@server
OpenSSH_8.9p1, OpenSSL 3.0.2
debug1: Connecting to server [192.168.1.100] port 22.
```

---

### `scp` - Secure copy

**Examples:**

```bash
# Example 1: Copy file to remote server
$ scp file.txt user@server:/home/user/
file.txt                    100%  1024    1.0KB/s   00:01

# Example 2: Copy from remote to local
$ scp user@server:/var/log/app.log ./
app.log                     100%   45KB  45.2KB/s   00:01

# Example 3: Copy directory recursively (-r)
$ scp -r project/ user@server:/home/user/
file1.txt                   100%  2048    2.0KB/s   00:01
file2.txt                   100%  4096    4.0KB/s   00:01

# Example 4: Use specific port (-P)
$ scp -P 2222 data.csv admin@server:/tmp/
data.csv                    100%  512KB 512.0KB/s   00:01

# Example 5: Preserve file attributes (-p)
$ scp -p backup.tar.gz user@server:/backups/
backup.tar.gz               100%  2.5MB  2.5MB/s   00:01
```

---

### `wget` - Download files

**Examples:**

```bash
# Example 1: Download file
$ wget https://example.com/file.zip
--2025-12-17 07:35:42--  https://example.com/file.zip
Resolving example.com... 93.184.216.34
Connecting to example.com|93.184.216.34|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1048576 (1.0M)
Saving to: 'file.zip'
100%[===================>] 1,048,576   5.00MB/s   in 0.2s

# Example 2: Download with custom name (-O)
$ wget -O myfile.zip https://example.com/download.zip
Saving to: 'myfile.zip'

# Example 3: Continue interrupted download (-c)
$ wget -c https://example.com/largefile.iso
HTTP request sent, awaiting response... 206 Partial Content
Length: 4294967296 (4.0G), 2147483648 (2.0G) remaining

# Example 4: Download in background (-b)
$ wget -b https://example.com/bigfile.tar.gz
Continuing in background, pid 1234.
Output will be written to 'wget-log'.

# Example 5: Limit download speed (--limit-rate)
$ wget --limit-rate=500k https://example.com/file.zip
Downloading at 500 KB/s
```

---

### `curl` - Transfer data

**Examples:**

```bash
# Example 1: GET request
$ curl https://api.example.com/users
{"users": [{"id": 1, "name": "Alice"}, {"id": 2, "name": "Bob"}]}

# Example 2: Download file (-O)
$ curl -O https://example.com/file.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1024k  100 1024k    0     0  5120k      0 --:--:-- --:--:-- --:--:-- 5120k

# Example 3: POST request with data (-d)
$ curl -X POST -d '{"name":"John"}' https://api.example.com/users
{"id": 3, "name": "John", "created": true}

# Example 4: Include headers (-H)
$ curl -H "Authorization: Bearer token123" https://api.example.com/protected
{"message": "Access granted"}

# Example 5: Follow redirects (-L)
$ curl -L https://short.url/abc123
(follows redirect to final destination)
```

## 9. User Management

### `useradd` - Create new user

**Examples:**

```bash
# Example 1: Create basic user
$ sudo useradd john
$ grep john /etc/passwd
john:x:1001:1001::/home/john:/bin/sh

# Example 2: Create with home directory (-m)
$ sudo useradd -m alice
$ ls -ld /home/alice
drwxr-xr-x 2 alice alice 4096 Dec 17 07:00 /home/alice

# Example 3: Specify shell (-s)
$ sudo useradd -s /bin/bash bob
$ grep bob /etc/passwd
bob:x:1002:1002::/home/bob:/bin/bash

# Example 4: Add to groups (-G)
$ sudo useradd -G sudo,developers charlie
$ groups charlie
charlie : charlie sudo developers

# Example 5: Set expiry date (-e)
$ sudo useradd -e 2025-12-31 tempuser
$ sudo chage -l tempuser
Account expires                         : Dec 31, 2025
```

---

### `userdel` - Delete user

**Examples:**

```bash
# Example 1: Delete user (keep home)
$ sudo userdel john
$ ls /home/
alice  bob  john

# Example 2: Delete user and home (-r)
$ sudo userdel -r alice
$ ls /home/
bob

# Example 3: Force deletion (-f)
$ sudo userdel -f bob
(removes even if user is logged in)

# Example 4: Verify deletion
$ sudo userdel charlie
$ grep charlie /etc/passwd
(no output - user deleted)

# Example 5: Delete with backup
$ sudo userdel -r tempuser
$ ls /home/
(tempuser home directory removed)
```

---

### `passwd` - Change password

**Examples:**

```bash
# Example 1: Change own password
$ passwd
Changing password for user.
Current password:
New password:
Retype new password:
passwd: password updated successfully

# Example 2: Change another user's password (sudo)
$ sudo passwd alice
New password:
Retype new password:
passwd: password updated successfully

# Example 3: Lock account (-l)
$ sudo passwd -l bob
passwd: password expiry information changed.
$ sudo passwd -S bob
bob L 12/17/2025 0 99999 7 -1

# Example 4: Unlock account (-u)
$ sudo passwd -u bob
passwd: password expiry information changed.

# Example 5: Force password change on next login (-e)
$ sudo passwd -e charlie
passwd: password expiry information changed.
```

---

### `su` - Switch user

**Examples:**

```bash
# Example 1: Switch to root
$ su
Password:
# whoami
root

# Example 2: Switch to specific user
$ su alice
Password:
$ whoami
alice

# Example 3: Switch with login shell (-)
$ su - bob
Password:
$ pwd
/home/bob

# Example 4: Execute command as user (-c)
$ su - alice -c 'whoami'
alice

# Example 5: Preserve environment (-p)
$ su -p charlie
Password:
$ echo $USER
original_user
```

---

### `sudo` - Execute as superuser

**Examples:**

```bash
# Example 1: Run command as root
$ sudo apt update
[sudo] password for user:
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease

# Example 2: Run as specific user (-u)
$ sudo -u alice whoami
alice

# Example 3: Edit file safely (sudoedit)
$ sudo -e /etc/hosts
(opens in default editor)

# Example 4: List sudo privileges (-l)
$ sudo -l
User user may run the following commands:
    (ALL : ALL) ALL

# Example 5: Run without password prompt (-S)
$ echo 'password' | sudo -S apt update
(uses password from stdin)
```

## 10. Package Management

### `apt-get install` - Install packages

**Examples:**

```bash
# Example 1: Install single package
$ sudo apt-get install nginx
Reading package lists... Done
Building dependency tree... Done
The following NEW packages will be installed:
  nginx
0 upgraded, 1 newly installed, 0 to remove

# Example 2: Install multiple packages
$ sudo apt-get install git curl vim
The following NEW packages will be installed:
  curl git vim

# Example 3: Install without prompts (-y)
$ sudo apt-get install -y python3-pip
Reading package lists... Done
Setting up python3-pip (22.0.2+dfsg-1) ...

# Example 4: Simulate installation (-s)
$ sudo apt-get install -s docker.io
NOTE: This is only a simulation!

# Example 5: Install specific version
$ sudo apt-get install nginx=1.18.0-0ubuntu1
The following packages will be DOWNGRADED:
  nginx
```

---

### `apt-get update` - Update package index

**Examples:**

```bash
# Example 1: Basic update
$ sudo apt-get update
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Fetched 2,456 kB in 2s (1,228 kB/s)
Reading package lists... Done

# Example 2: Update with error handling
$ sudo apt-get update || echo "Update failed"
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease

# Example 3: Quiet mode (-q)
$ sudo apt-get update -q
(minimal output)

# Example 4: Update and check upgradable
$ sudo apt-get update
$ apt list --upgradable
Listing... Done
nginx/jammy 1.18.0-1 amd64 [upgradable from: 1.18.0-0]

# Example 5: Update specific repository
$ sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/custom.list"
```

---

### `apt-get upgrade` - Upgrade packages

**Examples:**

```bash
# Example 1: Upgrade all packages
$ sudo apt-get upgrade
Reading package lists... Done
Building dependency tree... Done
The following packages will be upgraded:
  nginx openssl
2 upgraded, 0 newly installed, 0 to remove

# Example 2: Upgrade without prompts (-y)
$ sudo apt-get upgrade -y
Preparing to unpack .../nginx_1.18.0-1_amd64.deb ...
Unpacking nginx (1.18.0-1) over (1.18.0-0) ...

# Example 3: Simulate upgrade (-s)
$ sudo apt-get upgrade -s
Inst nginx [1.18.0-0] (1.18.0-1 Ubuntu:22.04/jammy [amd64])

# Example 4: Download only (-d)
$ sudo apt-get upgrade -d
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 nginx
Download complete and in download only mode

# Example 5: Full upgrade (dist-upgrade)
$ sudo apt-get dist-upgrade
Calculating upgrade... Done
The following packages will be REMOVED:
  old-kernel
```

---

### `apt-get remove` - Uninstall packages

**Examples:**

```bash
# Example 1: Remove package
$ sudo apt-get remove nginx
Reading package lists... Done
The following packages will be REMOVED:
  nginx
0 upgraded, 0 newly installed, 1 to remove

# Example 2: Remove with config files (purge)
$ sudo apt-get purge nginx
Removing nginx (1.18.0-1) ...
Purging configuration files for nginx (1.18.0-1) ...

# Example 3: Remove without prompts (-y)
$ sudo apt-get remove -y apache2
Removing apache2 (2.4.52-1ubuntu4) ...

# Example 4: Remove and autoremove dependencies
$ sudo apt-get remove nginx
$ sudo apt-get autoremove
The following packages will be REMOVED:
  nginx-common nginx-core

# Example 5: Simulate removal (-s)
$ sudo apt-get remove -s docker.io
Remv docker.io [20.10.12-0ubuntu4]
```

---

### `apt-cache search` - Search for packages

**Examples:**

```bash
# Example 1: Basic search
$ apt-cache search nginx
nginx - small, powerful, scalable web/proxy server
nginx-common - small, powerful, scalable web/proxy server - common files

# Example 2: Search with name only (--names-only)
$ apt-cache search --names-only python
python3 - interactive high-level object-oriented language
python3-pip - Python package installer

# Example 3: Show package details
$ apt-cache show nginx
Package: nginx
Version: 1.18.0-1
Description: small, powerful, scalable web/proxy server

# Example 4: Search and filter with grep
$ apt-cache search database | grep -i mysql
mysql-server - MySQL database server
mysql-client - MySQL database client

# Example 5: List all packages matching pattern
$ apt-cache search '^python3-'
python3-pip - Python package installer
python3-requests - elegant HTTP library for Python3
```

## 11. File Transfer

### `rsync` - Synchronize files

**Examples:**

```bash
# Example 1: Sync local directories
$ rsync -av /source/ /destination/
sending incremental file list
file1.txt
file2.txt
sent 2,048 bytes  received 42 bytes  4,180.00 bytes/sec

# Example 2: Sync to remote server
$ rsync -avz /local/dir/ user@server:/remote/dir/
building file list ... done
./
data.txt
sent 1,234 bytes  received 20 bytes  836.00 bytes/sec

# Example 3: Dry run (-n)
$ rsync -avn /source/ /dest/
(dry run) file1.txt
(dry run) file2.txt
(no actual transfer)

# Example 4: Delete files in destination (--delete)
$ rsync -av --delete /source/ /dest/
deleting old_file.txt
file1.txt
file2.txt

# Example 5: Show progress (--progress)
$ rsync -av --progress largefile.iso /backup/
largefile.iso
  4,294,967,296 100%   50.00MB/s    0:01:21 (xfr#1, to-chk=0/1)
```

---

### `sftp` - Secure FTP

**Examples:**

```bash
# Example 1: Connect to server
$ sftp user@server.com
Connected to server.com.
sftp>

# Example 2: Upload file (put)
sftp> put local file.txt
Uploading localfile.txt to /home/user/localfile.txt
localfile.txt                           100% 1024     1.0KB/s   00:01

# Example 3: Download file (get)
sftp> get remotefile.txt
Fetching /home/user/remotefile.txt to remotefile.txt
remotefile.txt                          100% 2048     2.0KB/s   00:01

# Example 4: List remote files (ls)
sftp> ls
Documents    Downloads    Pictures    Videos

# Example 5: Change remote directory (cd)
sftp> cd /var/www
sftp> pwd
Remote working directory: /var/www
```

---

## 12. System Monitoring and Maintenance

### `htop` - Interactive process viewer

**Examples:**

```bash
# Example 1: Basic usage
$ htop
  1  [|||||||||||||||100.0%]   Tasks: 156, 423 thr; 1 running
  2  [||||||         45.2%]    Load average: 0.52 0.58 0.59
  Mem[|||||||||||15.2G/15.8G]  Uptime: 1 day, 03:25:42
  Swp[               0K/2.0G]

  PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
 1234 user       20   0 2456M  345M  89.4M S  8.3 15.2  0:45.23 chrome
 5678 user       20   0 1234M  123M  45.6M S  3.2  0.8  0:12.34 node

# Example 2: Sort by memory (F6 then select MEM%)
$ htop
(interactive - press F6, select MEM%)

# Example 3: Filter by user (-u)
$ htop -u alice
(shows only alice's processes)

# Example 4: Tree view (-t)
$ htop -t
(displays process tree)

# Example 5: No color mode (-C)
$ htop -C
(monochrome display)
```

---

### `du` - Disk usage

**Examples:**

```bash
# Example 1: Show directory size (-sh)
$ du -sh /home/user/documents
2.5G    /home/user/documents

# Example 2: Show all subdirectories (-h)
$ du -h /var/log
4.0K    /var/log/apt
12M     /var/log/apache2
256K    /var/log/nginx
15M     /var/log

# Example 3: Summarize top-level only (-d 1)
$ du -h -d 1 /home/user
1.2G    /home/user/Documents
500M    /home/user/Downloads
3.5G    /home/user

# Example 4: Sort by size
$ du -h /var/log | sort -h
4.0K    /var/log/apt
256K    /var/log/nginx
12M     /var/log/apache2

# Example 5: Exclude pattern (--exclude)
$ du -sh --exclude='*.log' /var/log
3.2M    /var/log
```

---

### `reboot` - Restart system

**Examples:**

```bash
# Example 1: Immediate reboot
$ sudo reboot
Broadcast message from user@server
The system is going down for reboot NOW!

# Example 2: Reboot with message
$ sudo reboot "System maintenance"
Broadcast message: System maintenance
The system will reboot now

# Example 3: Force reboot (-f)
$ sudo reboot -f
(forces immediate reboot, skips shutdown scripts)

# Example 4: Schedule reboot (using shutdown)
$ sudo shutdown -r +10
Broadcast message: System will reboot in 10 minutes

# Example 5: Reboot to firmware (--firmware)
$ sudo systemctl reboot --firmware-setup
(reboots to UEFI/BIOS settings)
```

---

### `shutdown` - Power off system

**Examples:**

```bash
# Example 1: Shutdown now
$ sudo shutdown now
Broadcast message from user@server
The system is going down for poweroff NOW!

# Example 2: Schedule shutdown
$ sudo shutdown +30
Shutdown scheduled for Tue 2025-12-17 08:05:00 IST

# Example 3: Shutdown at specific time
$ sudo shutdown 20:00
Shutdown scheduled for Tue 2025-12-17 20:00:00 IST

# Example 4: Cancel scheduled shutdown (-c)
$ sudo shutdown -c
Shutdown cancelled.

# Example 5: Shutdown with message
$ sudo shutdown +5 "Server maintenance in 5 minutes"
Broadcast message: Server maintenance in 5 minutes
```

---

## 13. Networking and Connectivity

### `ifconfig` - Network interface configuration

**Examples:**

```bash
# Example 1: Show all interfaces
$ ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.100  netmask 255.255.255.0  broadcast 192.168.1.255
        ether 00:0c:29:3a:2b:1c  txqueuelen 1000  (Ethernet)

# Example 2: Show specific interface
$ ifconfig eth0
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>
        inet 192.168.1.100  netmask 255.255.255.0

# Example 3: Bring interface up
$ sudo ifconfig eth0 up
(interface activated)

# Example 4: Bring interface down
$ sudo ifconfig eth0 down
(interface deactivated)

# Example 5: Set IP address
$ sudo ifconfig eth0 192.168.1.150 netmask 255.255.255.0
(IP address changed)
```

---

### `ping` - Test network connectivity

**Examples:**

```bash
# Example 1: Basic ping
$ ping google.com
PING google.com (142.250.185.46): 56 data bytes
64 bytes from 142.250.185.46: icmp_seq=0 ttl=117 time=12.3 ms
64 bytes from 142.250.185.46: icmp_seq=1 ttl=117 time=11.8 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss

# Example 2: Limit packet count (-c)
$ ping -c 5 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: icmp_seq=0 ttl=118 time=10.2 ms
...
--- 8.8.8.8 ping statistics ---
5 packets transmitted, 5 packets received, 0.0% packet loss

# Example 3: Set interval (-i)
$ ping -i 2 192.168.1.1
(sends packet every 2 seconds)

# Example 4: Set packet size (-s)
$ ping -s 1000 google.com
PING google.com (142.250.185.46): 1000 data bytes
1008 bytes from 142.250.185.46: icmp_seq=0 ttl=117 time=15.2 ms

# Example 5: Quiet output (-q)
$ ping -c 10 -q 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
--- 8.8.8.8 ping statistics ---
10 packets transmitted, 10 packets received, 0.0% packet loss
```

---

### `netstat` - Network statistics

**Examples:**

```bash
# Example 1: Show all connections (-a)
$ netstat -a
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:ssh             0.0.0.0:*               LISTEN
tcp        0      0 localhost:mysql         0.0.0.0:*               LISTEN

# Example 2: Show listening ports (-l)
$ netstat -l
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN

# Example 3: Show with process info (-p)
$ sudo netstat -tulpn
Active Internet connections (only servers)
Proto Local Address           PID/Program name
tcp   0.0.0.0:80              1234/nginx
tcp   0.0.0.0:3306            5678/mysqld

# Example 4: Show routing table (-r)
$ netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         192.168.1.1     0.0.0.0         UG        0 0          0 eth0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0

# Example 5: Show network statistics (-s)
$ netstat -s
Ip:
    12345 total packets received
    0 forwarded
    0 incoming packets discarded
    12340 incoming packets delivered
```

---

### `nc` - Netcat utility

**Examples:**

```bash
# Example 1: Connect to port
$ nc example.com 80
GET / HTTP/1.0

HTTP/1.0 200 OK
Content-Type: text/html

# Example 2: Listen on port (-l)
$ nc -l 8080
(listening on port 8080)

# Example 3: Port scanning (-z)
$ nc -zv google.com 80 443
Connection to google.com 80 port [tcp/http] succeeded!
Connection to google.com 443 port [tcp/https] succeeded!

# Example 4: Transfer file
# On receiver:
$ nc -l 9999 > received_file.txt
# On sender:
$ nc receiver_ip 9999 < file_to_send.txt

# Example 5: Chat between machines
# Machine 1:
$ nc -l 5555
# Machine 2:
$ nc machine1_ip 5555
(type messages to chat)
```

---

## 14. System Information

### `lsb_release` - Distribution info

**Examples:**

```bash
# Example 1: Show all information (-a)
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.1 LTS
Release:        22.04
Codename:       jammy

# Example 2: Show description only (-d)
$ lsb_release -d
Description:    Ubuntu 22.04.1 LTS

# Example 3: Show release number (-r)
$ lsb_release -r
Release:        22.04

# Example 4: Show codename (-c)
$ lsb_release -c
Codename:       jammy

# Example 5: Short format (-s)
$ lsb_release -sd
Ubuntu 22.04.1 LTS
```

---

### `hostname` - System hostname

**Examples:**

```bash
# Example 1: Show hostname
$ hostname
server01

# Example 2: Show FQDN (-f)
$ hostname -f
server01.example.com

# Example 3: Show IP address (-I)
$ hostname -I
192.168.1.100 10.0.0.5

# Example 4: Show short hostname (-s)
$ hostname -s
server01

# Example 5: Set hostname (temporary)
$ sudo hostname newserver
$ hostname
newserver
```

---

### `date` - Display/set date and time

**Examples:**

```bash
# Example 1: Show current date and time
$ date
Tue Dec 17 07:35:42 IST 2025

# Example 2: Custom format (+)
$ date "+%Y-%m-%d %H:%M:%S"
2025-12-17 07:35:42

# Example 3: Show UTC time (-u)
$ date -u
Tue Dec 17 02:05:42 UTC 2025

# Example 4: Show date from timestamp (-d)
$ date -d @1702800000
Sun Dec 17 12:20:00 IST 2023

# Example 5: Format for filenames
$ date "+%Y%m%d_%H%M%S"
20251217_073542
```

---

## 15. File Permissions and Ownership

### `ls -l` - List with permissions

**Examples:**

```bash
# Example 1: Basic long listing
$ ls -l
total 24
-rw-r--r-- 1 user user 1024 Dec 17 07:00 file1.txt
-rwxr-xr-x 1 user user 2048 Dec 17 06:30 script.sh
drwxr-xr-x 2 user user 4096 Dec 17 05:00 documents

# Example 2: Show hidden files (-la)
$ ls -la
total 32
drwxr-xr-x  5 user user 4096 Dec 17 07:00 .
drwxr-xr-x 10 root root 4096 Dec 16 10:00 ..
-rw-------  1 user user  256 Dec 17 06:00 .bash_history
-rw-r--r--  1 user user 1024 Dec 17 07:00 file1.txt

# Example 3: Human-readable sizes (-lh)
$ ls -lh
total 24K
-rw-r--r-- 1 user user 1.0K Dec 17 07:00 file1.txt
-rwxr-xr-x 1 user user 2.0K Dec 17 06:30 script.sh
drwxr-xr-x 2 user user 4.0K Dec 17 05:00 documents

# Example 4: Sort by modification time (-lt)
$ ls -lt
-rw-r--r-- 1 user user 1024 Dec 17 07:00 file1.txt
-rwxr-xr-x 1 user user 2048 Dec 17 06:30 script.sh
drwxr-xr-x 2 user user 4096 Dec 17 05:00 documents

# Example 5: Show inode numbers (-li)
$ ls -li
total 24
1234567 -rw-r--r-- 1 user user 1024 Dec 17 07:00 file1.txt
2345678 -rwxr-xr-x 1 user user 2048 Dec 17 06:30 script.sh
3456789 drwxr-xr-x 2 user user 4096 Dec 17 05:00 documents
```

---

## Summary

This comprehensive guide now includes **5 practical examples with realistic outputs** for every command across all 15 sections. Each example demonstrates:

- ✅ Real-world usage scenarios
- ✅ Common options and flags
- ✅ Actual command outputs
- ✅ Best practices and tips

Perfect for learning, reference, and hands-on practice!