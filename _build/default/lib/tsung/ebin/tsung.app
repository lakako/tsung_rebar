{application,tsung,
             [{description,"tsung, a load testing tool for TCP/UDP servers"},
              {vsn,"1.8.0"},
              {modules,[gen_ts_transport,ts_amqp,ts_bosh,ts_bosh_ssl,
                        ts_client,ts_client_sup,ts_cport,ts_digest,ts_dynvars,
                        ts_erlang,ts_fs,ts_http,ts_http_common,ts_ip_scan,
                        ts_jabber,ts_jabber_common,ts_job,ts_launcher,
                        ts_launcher_mgr,ts_launcher_static,ts_ldap,
                        ts_ldap_common,ts_local_mon,ts_mon_cache,ts_mqtt,
                        ts_mysql,ts_pgsql,ts_plugin,ts_raw,ts_search,
                        ts_server_websocket,ts_server_websocket_ssl,
                        ts_session_cache,ts_shell,ts_ssl,ts_ssl6,
                        ts_ssl_session_cache,ts_stats,ts_sup,ts_tcp,ts_tcp6,
                        ts_udp,ts_udp6,ts_utils,ts_webdav,ts_websocket,tsung]},
              {registered,[ts_launcher,ts_launcher_static,ts_mon_cache,ts_sup,
                           ts_session_cache]},
              {env,[{debug_level,2},
                    {snd_size,32768},
                    {rcv_size,32768},
                    {idle_timeout,600000},
                    {global_ack_timeout,infinity},
                    {connect_timeout,30000},
                    {max_warm_delay,15000},
                    {dump,full},
                    {parse_type,noparse},
                    {persistent,true},
                    {mes_type,dynamic},
                    {nclients,10},
                    {log_file,"./tsung.log"},
                    {http_modified_since_date,"Fri, 14 Nov 2003 02:43:31 GMT"},
                    {client_retry_timeout,10},
                    {max_retries,3},
                    {ssl_ciphers,negotiate},
                    {ssl_versions,negotiate},
                    {jabber_users,2000000},
                    {jabber_username,"c"},
                    {jabber_password,"pas"},
                    {jabber_domain,"mydomain.com"},
                    {websocket_path,"/chat"}]},
              {applications,[kernel,stdlib,asn1,crypto,public_key,ssl,crypto]},
              {mod,{tsung,[]}}]}.