resource "aws_emr_cluster" "cluster" {
  name          = var.cluster_name
  release_label = "emr-5.13.0"
  applications  = ["Spark"]

  ec2_attributes {
    key_name                          = "ondemand-var-spark-cluster"
    subnet_id                         = aws_subnet.main.id
    emr_managed_master_security_group = aws_security_group.allow_access.id
    emr_managed_slave_security_group  = aws_security_group.allow_access.id
    instance_profile                  = aws_iam_instance_profile.emr_profile.arn
  }

  master_instance_group {
    instance_type = "m5.xlarge"
  }

  core_instance_group {
    instance_count = var.cluster_core_instance_group_instance_count
    instance_type  = "m5.xlarge"
  }

  bootstrap_action {
    path = "s3://elasticmapreduce/bootstrap-actions/run-if"
    name = "runif"
    args = ["instance.isMaster=true", "echo running on master node"]
  }

  configurations_json = <<EOF
  [
    {
      "Classification": "hadoop-env",
      "Configurations": [
        {
          "Classification": "export",
          "Properties": {
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
          }
        }
      ],
      "Properties": {}
    },
    {
      "Classification": "spark-env",
      "Configurations": [
        {
          "Classification": "export",
          "Properties": {
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
          }
        }
      ],
      "Properties": {}
    }
  ]
EOF

  service_role = aws_iam_role.iam_emr_service_role.arn
}