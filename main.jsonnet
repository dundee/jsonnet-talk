local k = import "k.libsonnet";

{
    nginx: k.apps.v1.deployment.new(
        name="nginx",
        replicas=1,
        containers=[k.core.v1.container.new(
            name="nginx",
            image="nginx",
        )]
    )
}
