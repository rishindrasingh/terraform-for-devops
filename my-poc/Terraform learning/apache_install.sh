#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
echo "Hello, Rishindra! Congratulations...You Did it.." | sudo tee /var/www/html/index.html > /dev/null
sudo systemctl start apache2
sudo systemctl enable apache2
              