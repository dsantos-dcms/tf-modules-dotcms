# SSM ROLE
resource "aws_iam_role" "ssm_role" {
  count = var.allow_ssm ? 1 : 0   
  name = "ssm_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# SSM POLICY
resource "aws_iam_policy" "ssm_policy" {
  count = var.allow_ssm ? 1 : 0   
  name = "ssm_policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ssm:DescribeAssociation",
                "ssm:GetDeployablePatchSnapshotForInstance",
                "ssm:GetDocument",
                "ssm:DescribeDocument",
                "ssm:GetManifest",
                "ssm:GetParameter",
                "ssm:GetParameters",
                "ssm:ListAssociations",
                "ssm:ListInstanceAssociations",
                "ssm:PutInventory",
                "ssm:PutComplianceItems",
                "ssm:PutConfigurePackageResult",
                "ssm:UpdateAssociationStatus",
                "ssm:UpdateInstanceAssociationStatus",
                "ssm:UpdateInstanceInformation"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "ec2messages:AcknowledgeMessage",
                "ec2messages:DeleteMessage",
                "ec2messages:FailMessage",
                "ec2messages:GetEndpoint",
                "ec2messages:GetMessages",
                "ec2messages:SendReply"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
} 
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  count = var.allow_ssm ? 1 : 0   
  role       = aws_iam_role.ssm_role[0].name
  policy_arn = aws_iam_policy.ssm_policy[0].arn
}

# INSTANCE PROFILE
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  count = var.allow_ssm ? 1 : 0   
  name  = "ec2_ssm_profile"
  role = aws_iam_role.ssm_role[0].name
}