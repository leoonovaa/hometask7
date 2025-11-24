# Anna Leonova 4CS-32

# Hometask7

**Topic:** SSH dynamic & reverse port forwarding on AWS EC2 (Ubuntu 22.04)

Objective

* Launch an EC2 instance using **Ubuntu 22.04** (`ami-053b0d53c279acc90`)
* Configure SSH dynamic port forwarding (ssh -D) to create a SOCKS-proxy
* Run a local web server on the home computer
* Configure reverse SSH port forwarding (ssh -R) to expose the local web server to the Internet

Steps to Run

**Step 1 — Launch the EC2 Instance**

1. Open your AWS Management Console or use **AWS CLI**.
2. Launch a new **EC2 instance** with:

   * Image: `Ubuntu Server 22.04`
   * Instance type: `t3.micro`
   * Key pair: your existing key (`.pem` file)
   * **User data**: upload or paste your prepared setup script

Wait until the instance is in the **running** state.

 **Step 2 — SSH Dynamic Port Forwarding (SOCKS proxy)**

```bash
ssh -i "YOUR_KEY.pem" -D 8888 ubuntu@EC2_PUBLIC_IP
```

 **Step 3 — Start Local Web Server**

```bash
python -m http.server 8000
```

 **Step 4 — Reverse SSH Tunnel (-R)**

```bash
ssh -i "YOUR_KEY.pem" -R 9090:localhost:8000 ubuntu@EC2_PUBLIC_IP
```
