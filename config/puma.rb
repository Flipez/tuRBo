environment 'production'
#environment 'development'

workers 2
threads 1,6

#daemonize true

bind 'tcp://127.0.0.1:3000'

pidfile './wingman.pid'
