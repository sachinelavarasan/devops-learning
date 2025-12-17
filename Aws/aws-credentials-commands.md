```bash
aws --version
```
# This command checks the installed version of the AWS CLI.
# Example output: aws-cli/2.13.1 Python/3.9.11 Darwin/x86_64

```bash
aws iam list-users
```
# Lists all IAM users in your AWS account.
# Example output: A JSON list of IAM users with their details.

```bash
aws configure list-profiles
```
# Lists all the named profiles configured in your AWS CLI.
# Example output: 
# default
# personal_elavarasan_root

```bash
aws configure list
```
# Displays the current configuration settings for the AWS CLI.
# Example output includes region, output format, and credentials file location.

```bash
~/.aws/credentials
```
# This is the file where AWS CLI stores access keys for different profiles.
# Example content:
# [default]
# aws_access_key_id = YOUR_ACCESS_KEY
# aws_secret_access_key = YOUR_SECRET_KEY

```bash
aws configure
```
# Launches an interactive setup to configure the default profile.
# You will be prompted to enter:
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region
# - Output format (e.g., json, text, or table)

```bash
aws configure --profile personal_elavarasan_root
```
# Configures a specific named profile called `personal_elavarasan_root`.
# You will be prompted to enter the same details as above.

```bash
export AWS_PROFILE=personal_elavarasan_root
```
# Sets the environment variable `AWS_PROFILE` to use the specified profile.
# This makes the profile `personal_elavarasan_root` the default for the current terminal session.
# Example usage:
# aws s3 ls
# (This will use the `personal_elavarasan_root` profile.)