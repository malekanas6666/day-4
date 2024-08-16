#IAM user named Ahmed With EC2 Administrator Policy "AWS Managed policy"
resource "aws_iam_user" "F-user-iam" {
  name = "Ahmed"
}


resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.F-user-iam.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["ec2:*"]
      Resource = ["*"]
      Effect   = "Allow"
    }]
  })
}
#IAM user named Mahmoud With S3 put and get objects restricted with specific source IP
resource "aws_iam_user" "S-user-iam" {
  name = "Mahmoud"
}

resource "aws_iam_user_policy" "lb_ro2" {
  name = "test2"
  user = aws_iam_user.S-user-iam.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = [
        "s3:GetObject",
        "s3:PutObject",
      ]
      Resource = [aws_s3_bucket.bucket-1.arn]
      Effect   = "Allow"
    }]
  })
}
#AM user named Mostafa With IAM Role have access to get objects from S3.
resource "aws_iam_user" "TH-user-iam" {
  name = "Mostafa"
}

resource "aws_iam_user_policy" "lb_ro3" {
  name = "test3"
  user = aws_iam_user.TH-user-iam.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = [
        "s3:GetObject",
      ]
      Resource = [aws_s3_bucket.bucket-1.arn]
      Effect   = "Allow"
    }]
  })
}




