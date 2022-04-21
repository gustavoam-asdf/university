1. Create a service template in C:\Program Files\MySQL\MySQL Server 8.0\my.cnf like	this:
   ```sh
		[mysqld1]
		basedir = C:\\Program Files\\MySQL\\MySQL Server 8.0
		datadir = C:\\Program Files\\MySQL\\MySQL Server 8.0\\data\\instance_data_1
		port = 3307
		enable-named-pipe
		socket = mypipe1
	 ```
2. Autorize instance data folder
	```powershell
		mysqld  --initialize --console --datadir='C:\Program Files\MySQL\MySQL Server 8.0\data\instance_data_1'
	```
	This return a tmp password for root user, we need it to connect at first time.
3. Install service
   ```sh
	 	mysqld --install mysqld1
	 ```
4. Start service
	 ```powershell
	 	Start-Service mysqld1
	 ```
5. Connect using template config
	 ```powershell
	 	mysql -u root -P 3307 -p
	 ```
6. Alter root user password
	 ```sql
	 	ALTER USER 'root'@'localhost' IDENTIFIED BY 'root-password';
	 ```