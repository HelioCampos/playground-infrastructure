#!/bin/bash

sudo wget -q http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm >/dev/null 2>&1

sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm >/dev/null 2>&1
sudo yum install -y erlang >/dev/null 2>&1

sudo rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc >/dev/null 2>&1
sudo rpm -Uvh http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.4/rabbitmq-server-3.1.4-1.noarch.rpm >/dev/null 2>&1

sudo rabbitmq-plugins enable rabbitmq_management >/dev/null 2>&1
sudo rabbitmq-plugins enable rabbitmq_tracing >/dev/null 2>&1

echo "[
  { mnesia, [ { dump_log_write_threshold, 1000 } ] },
  { rabbit, [ { tcp_listeners, [ 5672 ] } ] }
]." > /tmp/rabbitmq.config
sudo mv /tmp/rabbitmq.config /etc/rabbitmq/rabbitmq.config

sudo chkconfig rabbitmq-server on >/dev/null 2>&1
sudo /sbin/service rabbitmq-server restart

sudo rm erlang-solutions-1.0-1.noarch.rpm 2>&1