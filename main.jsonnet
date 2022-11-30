local switch = true;
local value = if switch then "z" else "x";

local Deployment(name, replicas=1) = {
    apiVersion: "apps/v1",
    kind: "Deployment",
    metadata: {
        name: name,
    },
    spec: {
        selector: {
            matchLabels: {
                run: name,
            },
        },
        replicas: replicas,
        template: {
            metadata: {
                labels: {
                    run: name,
                },
            },
            spec: {
                containers: [{
                    name: name,
                    image: "nginx",
                    ports: [{containerPort: 80}],
                }],
            },
        },
    },
};

local deployment = Deployment("some-app") {
    spec+: {
        template+:{
            spec+:{
                volumes: [
                    {
                        name: "config",
                        configMap: {
                            name: "config",
                        },
                    },
                ],
            },
        },
    },
};

deployment
