1: CREATE GROUPS
sudo groupadd developers
sudo groupadd testers
sudo groupadd admins

2: CREATE USERS AND ASSIGN GROUPS
sudo useradd -m -G developers teju
sudo useradd -m -G testers nuthan
sudo useradd -m -G admins ramya

3: SET PASSWORDS
sudo passwd teju
sudo passwd nuthan
sudo passwd ramya

4: CREATE PROJECT DIRECTORY
sudo mkdir /projectX
sudo chown root:developers /projectX
sudo chmod 770 /projectX

5: VERIFY GROUP MEMBERSHIP
id teju
id nuthan
id ramya

6: PASSWORD POLICIES
Step 1: Set password aging policy for teju
sudo chage -M 60 -m 5 -W 10 teju

Step 2: Force nuthan password to expire
sudo passwd --expire nuthan

Step 3: Set account expiration date for ramya
sudo chage -E 2025-12-31 ramya

Step 4: Lock and Unlock teju
sudo passwd -l teju
sudo passwd -u teju

7: Disable login after inactivity for nuthan
sudo chage -I 30 nuthan

Verify password policies
sudo chage -l teju
sudo chage -l nuthan
sudo chage -l ramya

8: CONFIGURE SUDO PRIVILEGES

📌 Edit sudoers file safely

sudo visudo


➡️ Add these inside the file:

ALLOW TEJU TO RESTART SSH ONLY
teju ALL=(ALL) /bin/systemctl restart ssh, /bin/systemctl status ssh

ALLOW NUTHAN TO RUN ONLY NETWORK COMMANDS
nuthan ALL=(ALL) /usr/sbin/ifconfig, /usr/sbin/ip

ALLOW RAMYA PASSWORDLESS df
ramya ALL=(ALL) NOPASSWD: /bin/df

9: TEST COMMANDS
For ramya:
sudo df

For teju:
sudo systemctl restart ssh
sudo systemctl status ssh

For nuthan:
sudo ip addr
