## Cluster Autoscaler.

resource "aws_iam_role" "eks-cluster-autoscaler" {
  name = "${var.env}-eks-cluster-autoscaler-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Principal" : {
          "Federated" : "arn:aws:iam::739561048503:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/${var.eks_client_id}"
        },
        "Condition" : {
          "StringEquals" : {
            "oidc.eks.us-east-1.amazonaws.com/id/${var.eks_client_id}:aud" : "sts.amazonaws.com",
            "oidc.eks.us-east-1.amazonaws.com/id/${var.eks_client_id}:sub" : "system:serviceaccount:kube-system:cluster-autoscaler"
          }
        }
      }
    ]
  })

  tags = {
    Name = "${var.env}-eks-cluster-autoscaler-role"
  }
}


resource "aws_iam_policy" "cluster-autoscale" {
  name        = "${var.env}-eks-cluster-autoscaler-policy"
  path        = "/"
  description = "${var.env}-eks-cluster-autoscaler-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeScalingActivities",
          "autoscaling:DescribeTags",
          "ec2:DescribeImages",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeLaunchTemplateVersions",
          "ec2:GetInstanceTypesFromInstanceRequirements",
          "eks:DescribeNodegroup"
        ],
        "Resource" : ["*"]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup"
        ],
        "Resource" : ["*"]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster-autoscale" {
  policy_arn = aws_iam_policy.cluster-autoscale.arn
  role       = aws_iam_role.eks-cluster-autoscaler.name
}

#####
