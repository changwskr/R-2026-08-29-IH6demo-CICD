

C:\Programming(23-08-15)\vagrant-work>docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "8f6d3b3f5ebd228af1b7aaeace0755d55fd37910bcdc1f8a7abd9982743e5559",
        "Created": "2024-08-09T23:26:19.633122996Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "ba3d2db76bfb1e5615d2c8237d79be4565985bd3390d60423e05adbeee6c2717": {
                "Name": "docker-server",
                "EndpointID": "afe77be6c206b844d12ab5c1c0384cd015764653729528cdd7233426eddb9d8e",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
            "c7d8ab75a377fcc7cdd582a0190d0eeea40b62cec87457f69f287bc79492f1ef": {
                "Name": "ansible-server",
                "EndpointID": "a44312d56c7ef538d431793fa76d7381c30ddbb5a4ca24df157fcb4652ab9f08",
                "MacAddress": "02:42:ac:11:00:04",
                "IPv4Address": "172.17.0.4/16",
                "IPv6Address": ""
            },
            "d3f4302cce754aca8af14c200ed75a250f985fc7d1dd9c3d7434bfcb3d04cbb2": {
                "Name": "jenkins-server",
                "EndpointID": "d068f51cb36b091d9e3911e30947a65d9da642c8e16a474f0f98e8354aec9e6b",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]

C:\Programming(23-08-15)\vagrant-work>