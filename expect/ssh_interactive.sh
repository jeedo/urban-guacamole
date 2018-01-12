#!/usr/bin/expect -f
spawn assh -o PubkeyAuthentication=no -o StrictHostKeyChecking=no admin@aplxxx.net
proc expect_prompt {} \
{
  global spawn_id
  expect -re {.*/APIConnet>}
}

# set pass [lindex $argv 0] #get password also from command line

# timeout 2
# expect {
#   "Password:" { send "$pass\r"}
#   timeout { puts "timed out waiting for login."; exit 1 }
# }

expect "Password:"

stty -echo
expect_user -timeout 3600 -re "(.*)[\r\n]"
stty echo
send "$expect_out(1,string)\r"

expect_prompt
