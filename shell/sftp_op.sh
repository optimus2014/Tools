
# !/bin/bash

ftp_path=$1
local_file=$2

sftp_remote="{IP}"
sftp_port="22"

sftp_user="{user}"
sftp_pass="{password}"


# check local file
if [ -d "${local_file}" ]; then
    echo "本地文件存在:"${loacl_file}

else
    echo "本地文件不存在:"${local_file}
    echo "结束进程"
    exit 1
fi


# check remote path，put file

/usr/bin/expect << EOF
set timeout 5
spawn sftp -P ${sftp_port} ${sftp_user}@${sftp_remote}
expect {
    "yes/no" {
        send "yes\r"
        exp_continue
            }
     "password:" {
            send "${sftp_pass}\r"
            }
}

# check password

expect "sftp> "
send "ls ${ftp_path}\n"

expect "sftp> "
send "get -r ${ftp_path} ${local_file}\n"

expect "sftp> "
send "ls ${ftp_path}\n"

expect "sftp> "
send "bye\n"
EOF


