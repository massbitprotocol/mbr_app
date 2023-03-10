local _config = {
    server = {
        nginx = {
            port = "80",
            port_ssl = "443",
            server_name = "massbitroute.net"
        }
    },
    templates = {},
    apps = {
        app = "apps/app",
        -- sso = "apps/sso",
        game = "apps/game"
    },
    supervisors = {},
    supervisor = [[
[program:promtail]
command=/bin/bash _SITE_ROOT_/scripts/promtail.sh
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/promtail.log

[program:loki]
command=/bin/bash _SITE_ROOT_/scripts/loki.sh
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/loki.log

[program:prometheus]
command=/bin/bash _SITE_ROOT_/scripts/prometheus.sh
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/prometheus.log

[program:gdnsd]
command=/bin/bash _SITE_ROOT_/scripts/gdnsd.sh
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/gdnsd.log
]]
}
return _config
