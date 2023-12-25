{application,tsung_recorder,
             [{description,"tsung recorder"},
              {vsn,"1.8.0"},
              {modules,[ts_client_proxy,ts_client_proxy_sup,ts_proxy_http,
                        ts_proxy_listener,ts_proxy_pgsql,ts_proxy_recorder,
                        ts_proxy_webdav,ts_recorder_sup,tsung_recorder]},
              {registered,[ts_proxy_recorder,ts_proxy_listener]},
              {env,[{debug_level,6},
                    {ts_cookie,"humhum"},
                    {log_file,"./tsung.log"},
                    {plugin,ts_proxy_http},
                    {parent_proxy,false},
                    {pgsql_server,"127.0.0.1"},
                    {pgsql_port,5432},
                    {proxy_log_file,"./tsung_recorder"},
                    {proxy_listen_port,8090}]},
              {applications,[kernel,stdlib,asn1,crypto,public_key,ssl,crypto]},
              {mod,{tsung_recorder,[]}}]}.