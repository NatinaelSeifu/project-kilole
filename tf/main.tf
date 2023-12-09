terraform {
  

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.0"
    }
  }
   backend "s3" {

    bucket         = "terraform-state-key20231117084134961500000001"
    key            = "Project-Kilole/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true

  }
}

provider "aws" {

       }

resource "aws_s3_bucket" "kilole01" {
bucket = var.bucket_name

  tags = {
    name = var.bucket_tag
  }
}

#############################
# Firehose
#############################

resource "aws_kinesis_firehose_delivery_stream" "demo_delivery_stream" {
  name        = "kilole-project-delivery"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose.arn
    bucket_arn = aws_s3_bucket.kilole01.arn

}
}
resource "aws_iam_role" "firehose" {
  name = "DemoFirehoseAssumeRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "firehose_s3" {
  name_prefix = "allowfirehose"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "",
        "Effect": "Allow",
        "Action": [
            "s3:AbortMultipartUpload",
            "s3:GetBucketLocation",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:ListBucketMultipartUploads",
            "s3:PutObject"
        ],
        "Resource": [
            "${aws_s3_bucket.kilole01.arn}",
            "${aws_s3_bucket.kilole01.arn}/*"
        ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "firehose_s3" {
  role       = aws_iam_role.firehose.name
  policy_arn = aws_iam_policy.firehose_s3.arn
}