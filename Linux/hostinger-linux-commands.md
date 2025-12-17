# Linux Command-Line Tools - Complete Reference Guide

The top Linux command-line tools are utilities that enable you to manage various aspects of your operating system. They are commonly used in Linux servers where the absence of a graphical user interface means you can only use a terminal.

## Command Categories

There are various Linux utilities available in the command-line interface that send instructions to the system to perform different tasks. In general, they can be categorized into:

- **Filesystem browsing commands** - Utilities for navigating directories and paths
- **File and directory handling commands** - Tools for organizing and processing files and folders
- **User and access control commands** - Command-line instructions for managing accounts and their permissions
- **System and process monitoring commands** - Tools for analyzing system performance and processes like services
- **Network management commands** - Utilities for adjusting network settings

---

## Quick Reference Tables

### File and Folder Navigation Commands

| Command | Function |
|---------|----------|
| `ls` | List the content of a directory |
| `pwd` | Check a directory's path |
| `cd` | Change directory |
| `locate` | Search for a file and its path |
| `find` | Find a file within the current directory |

### File and Folder Operations Commands

| Command | Function |
|---------|----------|
| `mkdir` | Make a directory |
| `rmdir` | Remove a directory |
| `rm` | Delete a file |
| `cp` | Copy a file to another location |
| `mv` | Move or rename a file or a folder |
| `touch` | Create an empty file |
| `file` | Check a file type |
| `zip` and `unzip` | Compress or extract a ZIP archive |
| `tar` | Bundle files into a tarball |
| `nano`, `vi`, and `jed` | Open up a text editor |
| `cat` | Print a file's content |
| `grep` | Find a specific line from a file |
| `sed` | Search and replace a pattern in a file |
| `head` | Print the first few entries of a file |
| `tail` | Print the last few entries of a file |
| `awk` | Search and manipulate a pattern in a file |
| `sort` | Rearrange a file's content |
| `cut` | Select and print specific parts of a file |
| `diff` | Compare file content |
| `tee` | Print a command's output into a file and shell |
| `echo` | Print text in the shell |
| `ln` | Link files or folders |
| `alias` and `unalias` | Set or remove another name for a file or program |
| `apt` and `dnf` | Manage system repository and packages |

### User and Permission Management Commands

| Command | Function |
|---------|----------|
| `sudo` | Run a command as a superuser |
| `su` | Change user |
| `whoami` | Check the current user |
| `chmod` | Change an item's permission |
| `chown` | Change an item's ownership |
| `useradd` and `userdel` | Add or remove a new user |
| `passwd` | Set a new password for a user |

### System Monitoring and Processes Commands

| Command | Function |
|---------|----------|
| `df` | Check disk usage |
| `du` | Check the size of a folder and its content |
| `top` | Display running processes and their hardware consumption |
| `htop` | List and manage processes |
| `ps` | Summarize processes at a specific time |
| `uname` | Print system information |
| `time` | Measure command or program execution time |
| `systemctl` | Manage services |
| `watch` | Run a command indefinitely |
| `jobs` | Check running programs in the current shell |
| `kill` | Terminate a process |
| `shutdown` | Turn off your system |
| `history` | Check previously run commands |
| `man` | Displays the manual of another command |
| `cal` | Opens a calendar |

### Networking Commands

| Command | Function |
|---------|----------|
| `hostname` | Check system hostname |
| `ping` | Send packets to a destination |
| `wget` | Download files from a URL |
| `curl` | Transfer data to and from a URL |
| `ip` | Manage the system network |
| `netstat` | Display network information |
| `traceroute` | Track the packet during transmission |
| `nslookup` | Check DNS information |
| `dig` | Check information about a domain |
| `scp` | Copy items over a network |
| `rsync` | Sync items between two systems over a network |

---

## Detailed Command Reference

### 1. ls Command

The `ls` command lists the content of a folder, including files and directories.

**Syntax:**
```bash
ls [options] [directory_or_path]
```

**Examples:**
```bash
# List items inside subfolders with hidden content
ls -Ra /path/to/dir
```

If you omit the path, the `ls` command will check the content of your current directory. To list items inside subfolders, add the `-R` option. Meanwhile, use `-a` to show hidden content.

---

### 2. pwd Command

Use the `pwd` command to check the full path of your current working directory.

**Syntax:**
```bash
pwd [options]
```

The `pwd` command has only two options:
- **`-L`** - Prints environment variable content, like shortcuts, instead of the actual path
- **`-P`** - Outputs the exact canonical path

**Example:**

For example, `/shortcut/folder` is a shortcut for `/actual/path`, and you are currently in `/actual/path/dir`:

```bash
# Using -L option
pwd -L
# Output: /shortcut/folder/dir

# Using -P option
pwd -P
# Output: /actual/path/dir
```

---

### 3. cd Command

Use `cd` to navigate between directories in your Linux VPS.

**Syntax:**
```bash
cd [path_or_directory]
```

**Shortcuts:**
- `cd` - Returns to the current user's home directory
- `cd ..` - Moves a directory up
- `cd -` - Goes back to the previous directory

---

### 4. mkdir Command

The `mkdir` command lets you create one or multiple directories.

**Syntax:**
```bash
mkdir [options] directory_name1 directory_name2
```

**Example:**
```bash
# Create new_folder in /path/to/target_folder
mkdir path/to/target_folder/new_folder
```

By default, `mkdir` allows the current user to read, write, and execute files in the new folder. You can set custom privileges during the creation by adding the `-m` option.

---

### 5. rmdir Command

Run `rmdir` to delete empty directories in your Linux system.

**Syntax:**
```bash
rmdir [options] directory_name
```

**Example:**
```bash
# Force deletion with -p option
rmdir -p folder-name
```

> **Note:** The `rmdir` command won't work if the directory contains subfolders. To force the deletion, add the `–p` option.

---

### 6. rm Command

The `rm` command deletes files from a directory.

**Syntax:**
```bash
rm [options] file1 file2
```

**Example:**
```bash
# Remove folder and contents recursively
rm -rf folder-name
```

**Options:**
- **`-r`** - Remove a folder and its contents, including subdirectories
- **`-i`** - Display a confirmation message before removal
- **`-f`** - Force deletion without confirmation

> **⚠️ Warning!** Avoid using `-r` and `-f` unless necessary. Instead, add `-i` option to prevent accidental deletion.

---

### 7. cp Command

Use the `cp` command to copy files from your current directory to another folder.

**Syntax:**
```bash
cp file1 file2 [target_path]
```

**Examples:**
```bash
# Copy file to another location
cp source_file /path/to/target_file

# Copy directory and its contents recursively
cp -R /path/to/folder /target/path/to/folder_copy
```

---

### 8. mv Command

The main usage of the `mv` command is to move a file or folder to another location.

**Syntax:**
```bash
mv file_or_directory [target_directory]
```

**Examples:**
```bash
# Move file to another location
mv /original/path/file1.txt the/target/path

# Rename a file
mv old_name.txt new_name.txt

# Rename and move simultaneously
mv old/location/of/old_name.txt new/path/for/new_name.txt
```

---

### 9. touch Command

Run the `touch` command to create a new empty file in a specific directory.

**Syntax:**
```bash
touch [options] [path_and_file_name]
```

**Example:**
```bash
touch file.txt
```

---

### 10. file Command

The `file` command checks a file type, such as TXT, PDF, or others.

**Syntax:**
```bash
file [file_name]
```

**Example:**
```bash
# Check symbolic link target
file hostinger_sym.txt
```

You can add the `-k` option to print more detailed information about the item.

---

### 11. zip and unzip Commands

The `zip` command compresses one or multiple files into a ZIP archive.

**Syntax:**
```bash
# Compress files
zip [options] zip_file_name file1 file2

# Extract files
unzip [options] zip_file_name
```

---

### 12. tar Command

The `tar` command bundles multiple files or directories into an archive without compression.

**Syntax:**
```bash
tar [options] tar_file_name file1 file2
```

**Examples:**
```bash
# Create tar archive with gzip compression
tar -cfz archive.tar.gz file1.txt file2.txt

# Extract tar archive
tar -xf archive.tar
```

**Options:**
- **`-c`** - Create a new TAR file
- **`-f`** - Specify the archive's name
- **`-z`** - Enable gzip compression
- **`-x`** - Extract files

---

### 13. nano, vi, and jed Commands

These commands let you edit files using different text editors.

**Syntax:**
```bash
nano/vi/jed file_name
```

If the target file doesn't exist, these commands will create a new one.

---

### 14. cat Command

The concatenate, or `cat` command, has various usages. The most basic one is printing the content of a file.

**Syntax:**
```bash
cat file_name
```

**Examples:**
```bash
# Create a new file
cat > file.txt

# Combine multiple files
cat file1.txt file2.txt > target.txt
```

> **Tip:** To print the content in reverse order, use `tac` instead.

---

### 15. grep Command

Global regular expression print or `grep` lets you search specific lines from a file using keywords.

**Syntax:**
```bash
grep [options] keyword [file]
```

**Example:**
```bash
# Filter output from another command
ls | grep "file.txt"
```

---

### 16. sed Command

Use the `sed` command to search and replace patterns in files quickly.

**Syntax:**
```bash
sed [options] 'subcommand/new_pattern/target_pattern' input_file
```

**Example:**
```bash
# Replace 'red' with 'blue' in multiple files
sed 's/red/blue' colors.txt hue.txt
```

---

### 17. head Command

Use the `head` command to print the first few entries of a file.

**Syntax:**
```bash
head [options] file_name
command | head [options]
```

**Example:**
```bash
# Print first two bytes
head -c 2 file.txt
```

By default, `head` will show the first ten lines. You can change this using the `-n` option.

---

### 18. tail Command

The `tail` command is the opposite of `head`, allowing you to print the last few lines.

**Syntax:**
```bash
tail [options] file_name
command | tail [options]
```

**Example:**
```bash
# Extract last five lines from ping output
ping -c 10 8.8.8.8 | tail -n 5
```

---

### 19. awk Command

The `awk` command searches and manipulates regular expression patterns in a file.

**Syntax:**
```bash
awk '/regex pattern/{action}' input_file.txt
```

**Example:**
```bash
# Calculate average score and print above-average students
awk -F':' '{ total += $2; students[$1] = $2 } END { average = total / length(students); print "Average:", average; print "Above average:"; for (student in students) if (students[student] > average) print student }' score.txt
```

---

### 20. sort Command

Use the `sort` command to rearrange a file's content in a specific order.

**Syntax:**
```bash
sort [options] [file_name]
```

**Example:**
```bash
sort file.txt
```

**Options:**
- **`-r`** - Reverse the order
- **`-n`** - Sort numerically

---

### 21. cut Command

The `cut` command selects specific sections from a file and prints them as Terminal output.

**Syntax:**
```bash
cut options file
```

**Options:**
- **`-f`** - Selects a specific row field
- **`-b`** - Cuts the line by a specified byte size
- **`-c`** - Sections the line using a specified character
- **`-d`** - Separates lines based on delimiters

**Example:**
```bash
# Extract third to fifth field from comma-separated list
cut -d',' -f3-5 list.txt
```

---

### 22. diff Command

The `diff` command compares two files and prints their differences.

**Syntax:**
```bash
diff file_name1 file_name2
```

**Example:**
```bash
# Show differences in context format
diff -c 1.txt 2.txt
```

**Options:**
- **`-c`** - Enable context format
- **`-i`** - Ignore case sensitivity

---

### 23. tee Command

The `tee` command outputs another command's results to both the Terminal and a file.

**Syntax:**
```bash
command | tee [options] file_name
```

**Example:**
```bash
# Save ping output to file and append
ping 8.8.8.8 | tee -a test_network.txt
```

**Options:**
- **`-a`** - Append to existing file instead of overwriting

---

### 24. locate Command

The `locate` command searches for a file and prints its location path.

**Syntax:**
```bash
locate [options] [keyword]
```

**Example:**
```bash
# Case-insensitive search
locate -i filename.txt

# Update database manually
updatedb
```

---

### 25. find Command

The `find` command searches for a file within a specific directory.

**Syntax:**
```bash
find [path] [options] expression
```

**Example:**
```bash
# Find file.txt in specific folder
find path/to/folder -type f -name "file"
```

**Options:**
- **`-type f`** - Search files only
- **`-type d`** - Find directories only
- **`-name`** - Search by name

---

### 26. sudo Command

Superuser do or `sudo` enables non-root users who are part of the sudo group to execute administrative commands.

**Syntax:**
```bash
sudo [options] your_command
```

**Example:**
```bash
# Open file with nano as administrator
sudo nano file.txt
```

> **⚠️ Warning!** Since users with sudo privileges can change various settings of your system, use this command with caution.

---

### 27. su and whoami Commands

The `su` command lets you switch to another user in the Terminal session.

**Syntax:**
```bash
su [options] [username]

# Check current user
whoami
```

---

### 28. chmod Command

`chmod` lets you change the permissions of files or directories.

**Syntax:**
```bash
chmod [options] [permission] [file_or_directory]
```

**Example:**
```bash
chmod -rwx---r-- file1.txt
```

In Linux, there are three folder and file permissions:
- **`r`** - Read
- **`w`** - Write
- **`x`** - Execute

These can be assigned to three parties: the owner, a group, or other accounts.

---

### 29. chown Command

The `chown` command lets you change the ownership of files, directories, or symbolic links.

**Syntax:**
```bash
chown [options] newowner:newgroup file1 file2
```

**Examples:**
```bash
# Make admin-vps the owner
chown admin-vps file1.txt

# Change group only
chown :newgroup file1.txt
```

---

### 30. useradd, passwd, and userdel Commands

Use the `useradd` command to create a new account in your Linux system.

**Syntax:**
```bash
# Create user
useradd [options] new_username

# Set password
passwd new_username

# Delete user
userdel new_username
```

> **Pro Tip:** To set up a password and other details during the account creation process, use the `adduser` command instead.

---

### 31. df Command

The `df` command checks your Linux system's disk usage.

**Syntax:**
```bash
df [options] [file system]
```

The utility displays the used space in percentage and kilobyte (KB).

---

### 32. du Command

To check the size of a directory and its content, use the `du` command.

**Syntax:**
```bash
du [directory]
```

**Options:**
- **`-s`** - Summarize the total usage
- **`-M`** - Change information from KB to MB

---

### 33. top Command

The `top` command displays all running processes in your system and their hardware consumption.

**Syntax:**
```bash
top [options]
```

**Options:**
- **`-p`** - Check a specific process by ID
- **`-d`** - Change the delay between screen updates

---

### 34. htop Command

Like `top`, the `htop` command lets you display and manage processes in your Linux server.

**Syntax:**
```bash
htop [options]
```

**Options:**
- **`-C`** - Enable monochrome mode
- **`--tree`** - Show processes in a hierarchical view

---

### 35. ps Command

The `ps` command summarizes the status of all running processes at a specific time.

**Syntax:**
```bash
ps [options]
```

**Options:**
- **`-A`** - List all processes
- **`-r`** - Check only running processes
- **`-u username`** - Query processes for a particular account

---

### 36. uname Command

The unix name or `uname` command displays detailed information about your Linux machine.

**Syntax:**
```bash
uname [options]
```

**Example:**
```bash
# Display all system information
uname -a
```

---

### 37. hostname Command

Use the `hostname` command to check your VPS hostname and other related information.

**Syntax:**
```bash
hostname [options]
```

**Options:**
- **`-i`** - Check server's IP address
- **`-a`** - Print hostname alias
- **`-A`** - Output the system's FQDN

---

### 38. time Command

The `time` command measures the execution time of commands or scripts.

**Syntax:**
```bash
time command_or_script

# Measure series of commands
time command; command; command
```

---

### 39. systemctl Command

The `systemctl` command is used to manage services in your Linux system.

**Syntax:**
```bash
systemctl subcommand [service_name] [options]
```

**Example:**
```bash
# List all services
sudo systemctl list-unit-files --type service --all
```

---

### 40. watch Command

The `watch` command lets you continuously run a utility at a specific interval.

**Syntax:**
```bash
watch [options] command_name
```

**Example:**
```bash
watch netstat
```

**Options:**
- **`-n`** - Change the interval (default: 2 seconds)
- **`-d`** - Highlight changes in output

---

### 41. jobs Command

Jobs are tasks or commands that are running in your current shell.

**Syntax:**
```bash
jobs [options] [Job_ID]
```

**Options:**
- **`-l`** - Display detailed information
- **`-n`** - Show only tasks whose status has changed

---

### 42. kill Command

Use the `kill` command to terminate a process using its ID.

**Syntax:**
```bash
kill [signal_option] Process_ID

# Get process ID
ps ux
```

The `kill` command has 64 termination signals. By default, it uses the SIGTERM method.

---

### 43. shutdown Command

The `shutdown` command lets you turn off or restart your Linux system at a specific time.

**Syntax:**
```bash
shutdown [option] [time] [message]
```

**Examples:**
- `+5` - Shut down after five minutes
- **`-r`** - Restart the machine

---

### 44. ping Command

The `ping` command sends packets to a target server and fetches the responses.

**Syntax:**
```bash
ping [option] [hostname_or_IP_address]
```

**Example:**
```bash
# Send 15 packets every two seconds
ping -c 15 -i 2 google.com
```

**Options:**
- **`-c`** - Specify number of packets
- **`-i`** - Change interval between transfers

---

### 45. wget Command

The `wget` command lets you download files from the internet via HTTP, HTTPS, or FTP protocols.

**Syntax:**
```bash
wget [options] [URL]
```

**Example:**
```bash
# Download WordPress installer
wget https://wordpress.org/latest.zip
```

---

### 46. curl Command

Use the `curl` command to transfer data from or to a server by specifying its URL.

**Syntax:**
```bash
curl [options] URL
```

**Examples:**
```bash
# Download file
curl -O https://example.com/file.zip

# Test API endpoint
curl -X GET https://api.example.com/endpoint
```

---

### 47. scp Command

The `scp` command lets you securely copy files and directories between systems over a network.

**Syntax:**
```bash
scp [option] [source username@IP]:/[directory and file name] [destination username@IP]:/[destination directory]
```

**Example:**
```bash
# Copy file to VPS
scp file1.txt root@185.185.185.185:path/to/folder
```

**Options:**
- **`-P`** - Change the default SCP port
- **`-l`** - Limit transfer bandwidth
- **`-C`** - Enable compression

---

### 48. rsync Command

The `rsync` command syncs files or folders between two destinations.

**Syntax:**
```bash
rsync [options] source destination
```

**Example:**
```bash
# Sync with remote server
rsync /path/to/local/folder/ vps-user@185.185.185.185:/path/to/remote/folder/
```

**Options:**
- **`-a`** - Sync file attributes and symbolic links
- **`-z`** - Enable compression during transfer

---

### 49. ip Command

The `ip` utility lets you list and manage your system's network parameters.

**Syntax:**
```bash
ip [options] object command
```

**Example:**
```bash
# Show system IP address
ip address show
```

---

### 50. netstat Command

The `netstat` command displays information about your system's network configuration.

**Syntax:**
```bash
netstat [options]
```

**Options:**
- **`-a`** - Displays listening and closed sockets
- **`-t`** - Shows TCP connections
- **`-u`** - Lists UDP connections
- **`-r`** - Displays routing tables
- **`-i`** - Shows information about network interfaces
- **`-c`** - Continuously outputs network information

---

### 51. traceroute Command

The `traceroute` command tracks a packet's path when traveling between hosts.

**Syntax:**
```bash
traceroute [options] destination
```

**Options:**
- **`-m`** - Change maximum packet hops
- **`-n`** - Prevent resolving IP addresses
- **`-w`** - Enable timeout in seconds

---

### 52. nslookup Command

The `nslookup` command requests a DNS server to check a domain linked to an IP address or vice versa.

**Syntax:**
```bash
nslookup [options] domain-or-ip [dns-server]
```

**Options:**
- **`-type=`** - Specify information type (e.g., DNS records)
- **`-retry=`** - Set up automatic retry
- **`-port=`** - Use a specific port

---

### 53. dig Command

The domain information groper or `dig` command displays information about a domain.

**Syntax:**
```bash
dig [options] [server] [type] name-or-ip
```

**Examples:**
```bash
# Query MX records
dig MX domain.com

# Reverse DNS lookup
dig -x 8.8.8.8
```

---

### 54. history Command

Run the `history` command to check previously run utilities.

**Syntax:**
```bash
history [options]

# Rerun specific command
!145
```

**Options:**
- **`-r`** - Clear Terminal history

---

### 55. man Command

The `man` or manual command displays a comprehensive guide of another utility.

**Syntax:**
```bash
man [options] [section_number] command_name
```

**Example:**
```bash
# Check library call section
man 3 ls
```

---

### 56. echo Command

Use `echo` to print text in your command as a Terminal output.

**Syntax:**
```bash
echo [options] [text]

# Print to file
echo [options] [text] > [file_name]
```

**Example:**
```bash
echo "This will be printed in one line"
```

---

### 57. ln Command

The `ln` command links files or directories with a shortcut.

**Syntax:**
```bash
ln [options] source target
```

**Example:**
```bash
# Create hard link
ln target.txt shortcut.txt

# Create symbolic link
ln -s target.txt shortcut.txt
```

---

### 58. alias and unalias Commands

The `alias` command lets you set another name for a string.

**Syntax:**
```bash
# Create alias
alias name='string'

# Check alias
alias name

# Remove alias
unalias [name]
```

**Example:**
```bash
# Assign 'k' as alias for kill command
alias k='kill'
```

---

### 59. cal Command

The `cal` command displays a calendar in your Linux command-line interface.

**Syntax:**
```bash
cal [options] [month] [year]
```

**Options:**
- **`-3`** - Show current, previous, and next month

---

### 60. apt and dnf Commands

The `apt` command lets you manage APT libraries in Debian-based operating systems.

**Syntax:**
```bash
apt [options] subcommand
```

**Example:**
```bash
# Install Vim text editor
apt install vim
```

For Red Hat Enterprise Linux-based distros like CentOS and AlmaLinux, use `dnf` with the same syntax and options.

> **Note:** Running both `apt` and `dnf` requires superuser privileges, which you can only obtain with `sudo` or via root.

---

## Summary

This comprehensive guide covers 60 essential Linux commands organized by category. Each command includes:

- Clear syntax examples
- Practical use cases
- Common options and flags
- Important warnings and tips

Master these commands to efficiently manage your Linux system from the command line!